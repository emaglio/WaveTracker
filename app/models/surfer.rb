class Surfer < ActiveRecord::Base
	belongs_to :user
	
	validates :nickname, :presence => true, :uniqueness => true
	validates :home_spot, :presence => true
	validates :goofy_regular, :presence => true
	validates :style, :presence => true
	validates :best_trick, :presence => false
	
end
