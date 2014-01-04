class Entry < ActiveRecord::Base
	belongs_to :car

	validates :car_id, presence: true
	validates :date, presence: true
	validates :odo, presence: true
	validates :quantity, presence: true
	validates :price, presence: true
end
