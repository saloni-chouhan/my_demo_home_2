class Airport < ApplicationRecord
	has_many :users
	has_many :airlines

	validates :airport_name, length: { minimum: 6 }
	validates :country , inclusion: { in: %w( India US ), message: "%{value} is not a valid Country." }
end
