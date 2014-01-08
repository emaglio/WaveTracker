module Forms
	class UserForm < Reform::Form
		include DSL
		include Reform::Form::ActiveModel
		
		properties [:myname, :location, :surname, :gender, :birth_date, :email, :password, :password_confirm, :agree, :remember], on: :user
		properties [:nickname, :home_spot, :goofy_regular, :style, :best_trick], 			on: :surfer
  
		VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		VALID_PASSWORD_REGEX = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])/
		validates :email,	:presence => true,
							format:	{with: VALID_EMAIL_REGEX}
		
		validates :password,	:password_confirm,	presence: true,
													length: {in: 5..20, too_short: "must have at least 5 words",
															too_long: "must have at most 20 words"},
													format: {with: VALID_PASSWORD_REGEX, 
													message: "must have at least: one number between 0 and 9; one Upper Case letter; one Lower Case letter"}
		validates :agree, :acceptance => {:accept => '1'}
		validates :myname, :surname, :birth_date, :location, :gender, :home_spot, :goofy_regular, :style, :best_trick, :nickname, :remember, :presence => false
		
		validate :passwords_match
		validate :check_email

		model :user, on: :user

		def save
			super
			user.surfer.save
		end

		
		private	
		def passwords_match
			if (self.password != self.password_confirm)
				errors.add(:password_confirm, "does not match with Password")
			end
		end

		def  check_email
			user = User.find_by(email: self.email)
			if user != nil
				errors.add(:email, "is already used from another user")
			end
		end
	end
end