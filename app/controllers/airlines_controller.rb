class AirlinesController < ApplicationController
	before_action :get_airport

	def new
		@airline = @airport.airlines.new
	end

	def create
		@airline = @airport.airlines.create(airline_params)

		if @airline.save
			redirect_to airport_airline_path(@airport,@airline)
		else
			render 'new'
		end
	end

	def index 
		@airlines = @airport.airlines
	end

	def show
		@airline = @airport.airlines.find(params[:id])
	end

	def edit
	  @airline = Airline.find(params[:id])
	end

	def update
		@airline = Airline.find(params[:id])
        
        if @airport.airlines.update(airline_params)
            redirect_to airport_airlines_path
        else
        	render 'edit'
        end
	end

	def destroy
		@airline = @airport.airlines.find(params[:id])
		@airline.destroy
		redirect_to airport_airlines_path
	end

	private 
	def get_airport
		@airport = Airport.find(params[:airport_id])
	end

	def airline_params
		params.require(:airline).permit(:name,:airline_type,:airport_id)
	end
end
