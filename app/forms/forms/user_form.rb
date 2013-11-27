module Forms
	class UserForm < Reform::Form
		include DSL
		include Reform::Form::ActiveModel
		
		properties [:myname, :location, :surname, :gender, :birth_date, :email, :password, :password_confirm, :agree], on: :user
		properties [:nickname, :home_spot, :goofy_regular, :style, :best_trick], 			on: :surfer
  
		VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		VALID_PASSWORD_REGEX = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])/
		validates :email,	:presence => true,
							format:	{with: VALID_EMAIL_REGEX}
		validates_uniqueness_of :email
		validates :password,	:password_confirm,	presence: true,
													length: {in: 5..20, too_short: "must have at least 5 words",
															too_long: "must have at most 20 words"},
													format: {with: VALID_PASSWORD_REGEX, 
													message: "must have at least: one number between 0 and 9; one Upper Case letter; one Lower Case letter"}
		validate :passwords_match
		validates :agree, :acceptance => {:accept => '1'}
		validates :myname, :surname, :birth_date, :location, :gender, :home_spot, :goofy_regular, :style, :best_trick, :nickname, :presence => false
		# validates_uniqueness_of :nickname
		
		model :user
		
		private	
		def passwords_match
			if (self.password != self.password_confirm)
				errors.add(:password_confirm, "does not match with Password")
			end
		end 
	end
end