class FlightsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index] 
	# load_and_authorize_resource
	# before_action :is_admin?, only: [:show, :index]
	def new 
		@flight = Flight.new
	end

	def index 
		@flights = Flight.all
		
		if params[:search]
			@search = params[:search]
			@flights = @flights.search_by(@search)
		else
			@flights = Flight.all
		end
	end

	def create
		@flight = Flight.create(flight_params)

		if @flight.save
			redirect_to @flight
		else
			render 'new'
		end
	end

	def edit
		@flight = Flight.find(params[:id])
	end

	def update
		@flight = Flight.find(params[:id])
		if @flight.update(flight_params)
			redirect_to flights_path
		else
			render 'edit'
		end
	end

	def show
		@flight = Flight.find(params[:id])
	end
	def destroy
		@flight = Flight.find(params[:id])
		@flight.destroy
		redirect_to flights_path
	end

	private
	# def set_airline
 #      @airline = Airline.find(params[:airline_id])
	# end
	# def is_admin?
 #    	current_user.role.code == 'employee'
 #    end

	def flight_params
		params.require(:flight).permit(:name,:source,:destination,:status,:airline_id)
	end
end
