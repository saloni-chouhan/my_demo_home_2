class Airport < ApplicationRecord
	has_many :users
	has_many :airlines,dependent: :destroy

	validates :airport_name, length: { minimum: 6 },uniqueness: { message: "Already exists..." }
	validates :country , inclusion: { in: %w( India, US ), message: "%{value} is not a valid Country." }
	# validates :state, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	# validates :city, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
