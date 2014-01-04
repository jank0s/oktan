class Car < ActiveRecord::Base
	belongs_to :user
	belongs_to :model
	belongs_to :fuel_type
end
