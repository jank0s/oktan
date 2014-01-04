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
end
