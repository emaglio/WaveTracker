class Spot < ActiveRecord::Base

	validates :spot_name, :location, :spot_type, :wave_direction, :level, :best_swell, :tide, :best_wind,:presence => true
	validates :bottom_type, :frequence, :wave_size, :surfers, :hazards, :presence => false 

end
