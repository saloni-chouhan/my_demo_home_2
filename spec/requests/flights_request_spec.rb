require 'rails_helper'

RSpec.describe "Flights", type: :request do
	# make get request
     get flights_path

	# make post request
    post flights_path, flight: { name: 'Indigo',source: 'Indore', destination: 'Bhopal', status: 'On the Way', airline_id:  }

	# check the response


end