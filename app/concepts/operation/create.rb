require "reform/form/validation/unique_validator"

class User < ActiveRecord::Base 
  
  class Create < Trailblazer::Operation
    include Model
    model User, :create

    contract do
      properties :myname,
      properties :location,
      properties :surname,
      properties :gender,
      properties :birth_date,
      properties :email,
      properties :password,
      properties :password_confirm,
      properties :agree,
      properties :remember  
    end

    #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PASSWORD_REGEX = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])/
    validates :email, :presence => true,
              format: {with: VALID_EMAIL_REGEX}
    
    validates :password,  :password_confirm,  presence: true,
                          length: {in: 5..20, too_short: "must have at least 5 words",
                              too_long: "must have at most 20 words"},
                          format: {with: VALID_PASSWORD_REGEX, 
                          message: "must have at least: one number between 0 and 9; one Upper Case letter; one Lower Case letter"}
    validates :agree, :acceptance => {:accept => '1'}
    validates :myname, :location, :nickname, :presence => true
    
    
    def process(params)
      validate(params[:user]) do
        contract.save
      end
  end

end