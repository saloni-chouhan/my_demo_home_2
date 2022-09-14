class AirlinesController < ApplicationController
	before_action :get_airport
	def new
		@airline = @airport.airlines.build
	end
	def create
		@airline = @airport.airlines.build(airline_params)

		if @airline.save
			redirect_to airport_airlines_path(@airline)
		else
			render 'new'
		end
	end
	def index 
		@airlines = @airport.airlines
	end
	def show
	end

	private 
	def get_airport
		@airport = Airport.find(params[:airport_id])
	end

	def airline_params
		params.require(:airline).permit(:name,:airline_type)
	end
end
