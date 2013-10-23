class Wetsuite < ActiveRecord::Base
	validates :brand, :presence => true
	validates :thickness, :presence => true
	validates :type, :presence => true
end
