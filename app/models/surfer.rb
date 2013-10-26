class Surfer < ActiveRecord::Base
	belongs_to :user, :foreign_key => :user_id
	
	validates :nickname, :presence => true, :uniqueness => true
	validates :home_spot, :presence => false
	validates :goofy_regular, :presence => false
	validates :style, :presence => false
	validates :best_trick, :presence => false
	
end
