class Ticket < ApplicationRecord
	belongs_to :flight
	
	has_one :booking,dependent: :destroy

	# validates :passport_no, format: { with: /[A-PR-WYa-pr-wy][1-9]\\d\\s?\\d{4}[1-9]/ }
	validates :seatno, :class_type, :source, :destination, presence: true
	validates :class_type, inclusion: { in: %w(First Business Economy first business economy) }

	private
	def self.search_by(search_term)
        where("seatno LIKE :search OR LOWER(source) LIKE :search OR LOWER(destination) OR LOWER(class_type) LIKE :search  LIKE :search ", search: "%#{search_term.downcase}%")
    end

end
