class User < ActiveRecord::Base
  attr_accessor :myname, :surname, :birth_date, :location, :gender, :email, :password, :image
  validates :myname, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  
  def initilize(options = {})
    @myname = options[:myname]
    @surname = options[:surname]
    @birth_date = options[:birth_date]
    @location = options[:location]
    @gender = options[:gender]
    @email = options[:email]
    @password = options[:password]
	@image = options[:image]
  end
  
end
