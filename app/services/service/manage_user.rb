module Service
	class ManageUser
		attr_accessor :user_params, :surfer_params
		
		def initialize(user_params, surfer_params)
			@user_params = user_params
			@surfer_params = surfer_params
		end
		
		def create #when other User type will be created, this part must be changed
			user = User.new(user_params)
			surfer = user.bild_surfer(surfer_params)
			ActiveRecord::Base.transaction do
				user.save!
				surfer.save!
			end
			user
		end
		
		def update(user_id, surfer_id)
			ActiveRecord::Base.transaction do
				user = User.find(user_id)
				surfer = Surfer.find(surfer_id)
				user.update!(user_params)
				surfer.update!(surfer_params)
				user
			end
		end
	end
end