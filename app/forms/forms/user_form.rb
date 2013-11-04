module Forms
	class UserForm < Reform::Form
		include DSL
		include Reform::Form::ActiveModel
		
		properties [:myname, :location, :surname, :gender, :birth_date, :email, :password], on: :user
		properties [:nickname, :home_spot, :goofy_regular, :style, :best_trick], 			on: :surfer
  
		validates :myname, :presence => true, :length => {:in => 3..20}
		validates :location, :gender, :password, :home_spot, :goofy_regular, :style, :best_trick, :nickname, :presence => true
		validates :surname, :birth_date, :presence => false
		VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		validates :email, :presence => true, format: {with: VALID_EMAIL_REGEX}
		# validates_uniqueness_of :nickname
		
		model :user
	end
end