class Flight < ApplicationRecord
  belongs_to :airline
  has_many :schedules,dependent: :destroy
  has_many :tickets,dependent: :destroy

  validates :name,:source,:destination, presence: true

  after_create :check_length_of_name



    private

    def check_length_of_name
      if self.name.length >= 6
        self.name =  name
      else
        self.name = "Length is less than 6"
      end
    end

    def self.search_by(search_term)
        where("LOWER(name) LIKE :search OR LOWER(source) LIKE :search OR LOWER(destination) LIKE :search", search: "%#{search_term.downcase}%")
    end
end
