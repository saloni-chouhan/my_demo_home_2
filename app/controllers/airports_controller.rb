class AirportsController < ApplicationController
	def new
		@airport = Airport.new
	end
	def create
		@airport = Airport.create(airport_params)

		if @airport.save
		    redirect_to @airport
	    else
	    	render 'new'
	    end
	end
	def index
		@airports = Airport.all
	end

	private 

	def airport_params
		params.require(:airport).permit(:airport_name,:country,:state,:city)
	end

end
