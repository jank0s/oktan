class Entry < ActiveRecord::Base
	belongs_to :car

	validates :car_id, presence: true
	validates :date, presence: true
	validates :odo, presence: true
	validates :quantity, presence: true
	validates :price, presence: true

	def calcKm
		self.odo-self.car.entries.where("odo < ?", self.odo).order(:odo).last.odo
	end

	def calcCon
		self.quantity/self.km*100
	end
end
