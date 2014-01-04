class Car < ActiveRecord::Base
	belongs_to :user
	belongs_to :model
	belongs_to :fuel_type
	has_many :entries

	validates :model_id, presence: true
	validates :user_id, presence: true
	validates :year, presence: true
	validates :power, presence: true
	validates :fuel_type_id, presence: true

	def avg
		return (self.entries.sum('quantity')-self.entries.order(:date).first.quantity)/(self.entries.maximum('odo')-self.entries.minimum('odo'))*100	end
end
