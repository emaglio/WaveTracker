class Board < ActiveRecord::Base
	validates :brand, :presence => true
	validates :shaper, :presence => false
	validates :size, :presence => true
	validates :type, :presence => true
	validates :fins, :presence => true
end
