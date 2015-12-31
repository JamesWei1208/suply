class Category < ActiveRecord::Base

	# TODO: add validation
	has_many :boards
	
end
