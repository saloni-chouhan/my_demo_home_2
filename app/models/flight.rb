class Flight < ApplicationRecord
	belongs_to :airline
    has_many :schedules,dependent: :destroy
    has_many :tickets,dependent: :destroy

    validates :name, presence: true,length: { minimum: 6 }
    validates :source, presence:true
    validates :destination, presence:true

    def self.search_by(search_term)
        where("LOWER(name) LIKE :search OR LOWER(source) LIKE :search OR LOWER(destination) LIKE :search", search: "%#{search_term.downcase}%")
    end
end
