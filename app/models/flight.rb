class Flight < ApplicationRecord
	belongs_to :airline
    has_many :schedules
    has_many :tickets
end
