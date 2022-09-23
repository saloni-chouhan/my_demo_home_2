class Schedule < ApplicationRecord
	belongs_to :flight

	validates :d_time,:a_time,:duration,presence: true 

	def self.search_by(search_term)
        where("flight_id LIKE :search ", search: "%#{search_term.downcase}%")
    end
end
