class Flight < ApplicationRecord
	belongs_to :airline
    has_many :schedules
end
