class User < ActiveRecord::Base
  has_one :surfer, dependent: :destroy
  # before_save :encrypt_password
  # after_save :clear_password
  
  validates :myname, :presence => true, :length => {:in => 3..20}
  validates :location, :gender, :presence => true
  validates :surname, :birth_date, :presence => false
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, format: {with: VALID_EMAIL_REGEX}
  validates :password, :presence => true
  
  # def encrypt_password
	# if password.present?
		# self.salt = BCrypt::Engine.generate_salt
		# self.encrypt_password = BCrypt::Engine.hash_secret(password, salt)
	# end
  # end
  
  # def clear_password
	# self.password = nil
  # end
end
