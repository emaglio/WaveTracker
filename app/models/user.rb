class User < ActiveRecord::Base
  attr_accessor :myname, :surname, :birth_date, :location, :gender, :email, :password
  
  validates :email, :presence => true
  validates :password, :presence => true, :include => { :in => 0..9, :lenght => {:minimum => 3, :maximum => 15}}
  
  def initilize(options = {})
    @myname = options[:myname]
    @surname = options[:surname]
    @birth_date = options[:birth_date]
    @location = options[:location]
    @gender = options[:gender]
    @email = options[:email]
    @password = options[:password]
  end
  
end
