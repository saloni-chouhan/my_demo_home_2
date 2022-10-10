class Booking < ApplicationRecord
	# Associations
	belongs_to :ticket
	belongs_to :user

	# Validations

	validates :ticket_id, uniqueness: { message: " currently not available try again later." }
	validates :name_of_passenger,:source,:destination,presence: true, length: { minimum: 3 }
	validates_each :name_of_passenger, :source, :destination do |record, attr, value|
        record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
    end
    validates :age, presence:true, numericality: { only_integer: true }
    validates :phone, presence:true,numericality: { only_integer: true }, length: { is: 10 }
    validates :address,presence:true, length: { minimum: 6 }
    validates :email, presence: true, email:true
	# validates :passport_no, format: { with: /^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}$/ }, :multiline => true  
    validates :passport_no, presence: true
	
    # CallBacks
	after_create :welcome_email

	# before_save :check_passport_length

	before_create :view_premissions
	
    # methods
	private
	def welcome_email
		BookingMailer.welcome_email(self.email).deliver_now
	end 

	def check_passport_length
		if passport_no.length == 8
			# byebug
			self.passport_no = passport_no
		else 
			self.passport_no = "Invalid Passport"
		end
	end

	def self.search_by(search_term)
        where("LOWER(name_of_passenger) LIKE :search OR LOWER(source) LIKE :search OR LOWER(destination) OR LOWER(class_type) LIKE :search ", search: "%#{search_term.downcase}%")
    end

    def self.view_premissions(current_user)
  		current_user.role.code == "admin"? Booking.all : current_user.bookings
	end

end
