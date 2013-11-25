module Forms
	class UserForm < Reform::Form
		include DSL
		include Reform::Form::ActiveModel
		
		properties [:myname, :location, :surname, :gender, :birth_date, :email, :password, :password_confirm], on: :user
		properties [:nickname, :home_spot, :goofy_regular, :style, :best_trick], 			on: :surfer
  
		validates :myname, :email, :password, :password_confirm, :presence => true
		validates :myname, :length => {:in => 3..20}
		validates :surname, :birth_date, :location, :gender, :home_spot, :goofy_regular, :style, :best_trick, :nickname, :presence => false
		VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		validates :email, format: {with: VALID_EMAIL_REGEX}
		# validates_uniqueness_of :nickname
		
		model :user
	end
end