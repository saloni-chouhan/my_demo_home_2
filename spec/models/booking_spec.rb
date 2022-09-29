require 'rails_helper'

describe Booking do
  describe '#email' do

  	it "validates presence" do
	  	record = Booking.new
	  	record.email = ''
	  	record.validate
	  	expect(record.errors[:email]).to include("can't be blank")

	  	record.email = 'foo@bar.com' # valid state
        record.validate 
        expect(record.errors[:email]).to_not include("can't be blank")
  	end
  end
  describe "#age" do
  	it "Check when age is a string" do
  		record = Booking.new
  		record.age = 'abc'
  		record.validate
  		expect(record.errors[:age]).to include("is not a number")
  	end
    
    it "Check when age is a number" do
    	record = Booking.new
  		record.age = "25"
  		record.validate
  		expect(record.errors[:age]).to_not include("is not a number")
  	end
     
    it "Checks when age entered is a combination of special character and number" do
    	record = Booking.new
  		record.age = "@2#"
  		record.validate
  		expect(record.errors[:age]).to include("is not a number")
  	end
  end

  describe "#name_of_passenger" do
  	it "When Name of Passenger does not starts with an uppercase" do
  		record = Booking.new
  		record.name_of_passenger = "saloni"
  		record.validate
  		expect(record.errors[:name_of_passenger]).to include("must start with upper case")
  	end

    it "When Name of Passenger starts with an uppercase" do
      record = Booking.new
  		record.name_of_passenger = "Saloni"
  		record.validate
  		expect(record.errors[:name_of_passenger]).to_not include("must start with upper case")
  	end

    	# it "After create send Booking confirmation mail" do
    	# 	book = Booking.new
    	# 	book.should_receive(:welcome_email)
    	# 	book.run_callbacks(:after_create)
    	# end

    # let(:email) { c(:email) }
    # FactoryBot.build(:email => 'everlastingwardrobe@example.com')

    # describe '#sendBooking Confirmation Mail' do 
    #   it 'Fires send_email method as after_create method callbacks' do
    #     expect(email).to receive(:welcome_email)
    #     email.run_callbacks(:create)
    #   end
    # end
    describe Booking do
      it { is_expected.to callback(:check_passport_length).before(:save) }
    end
end 
end