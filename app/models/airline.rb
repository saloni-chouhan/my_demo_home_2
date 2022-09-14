class Airline < ApplicationRecord
	belongs_to :airport
	has_many :flights

	validates :airline_type, inclusion: { in: %w( National International national international) }
end
