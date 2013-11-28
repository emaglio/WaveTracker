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

		def processUpdate (form)
			form do |data, map|
				user = ::Service::ManageUser.new(map[:user], map[:surfer]).update(form.user.id, form.surfer.id)
				yield user if block_given?
			end
		end
		
	end
end