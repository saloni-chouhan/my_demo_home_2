class Airline < ApplicationRecord
	belongs_to :airport
	has_many :flights,dependent: :destroy
    
    validates :name, presence: true, uniqueness: { message: " this Airline is already registered with this airport " }
	validates :airline_type, inclusion: { in: %w( National International national international) }
end
