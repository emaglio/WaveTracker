module Workflows
	class UserWorkflow
		attr_reader :form, :params
		
		def initialize(form, params)
			@form = form
			@params = params
		end
		
		def processCreate
			if form.validate(params)
				form.save do |data, map|
					user = ::Service::ManageUser.new(map[:user], map[:surfer]).create
					yield user if block_given?
				end
			end
		end

		def processUpdate
			ActiveRecord::Base.transaction do
				form.save do |data, map|
					user = User.find(form.user.id)
					surfer = Surfer.find(form.surfer.id)
					user.update!(map[:user])
					surfer.update!(map[:surfer])
					yield user if block_given?
				end
			user
			end
		end
		
	end
end