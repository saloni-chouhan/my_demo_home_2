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

	def show
		@airport = Airport.find(params[:id])
	end

	def edit
		@airport = Airport.find(params[:id])
	end

	def update
		@airport = Airport.find(params[:id])
		
		if @airport.update(airport_params)
			redirect_to airport_path(@airport)
		else
			render 'edit'
		end
	end
	def destroy
		@airport = Airport.find(params[:id])

		@airport.destroy
		redirect_to airports_path
	end

	private 

	def airport_params
		params.require(:airport).permit(:airport_name,:country,:state,:city)
	end

end
