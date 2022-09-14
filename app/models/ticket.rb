class Ticket < ApplicationRecord
	belongs_to :flight
	has_one :booking
end
