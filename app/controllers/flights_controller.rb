class FlightsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index] 
  # before_action :index, only: [:show]
  # load_and_authorize_resource
  # before_action :is_admin?, only: [:show, :index]
  def new 
    @flight = Flight.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def index 
    @flights = Flight.all
    
    if params[:search]
      @search = params[:search]
      @flights = @flights.search_by(@search)
    else
      @flights = Flight.all
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def create
    @flight = Flight.create(flight_params)
      respond_to do |format|
        if @flight.save
          redirect_to @flight
          format.js
        else
          render 'new'
        end
      end
  end
        
  def edit
    @flight = Flight.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @flight = Flight.find(params[:id])
    respond_to do |format|
    if @flight.update(flight_params)
      redirect_to flights_path

      format.js
    else
      render 'edit'
    end
    end
  end

  def show
    @flight = Flight.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy

    respond_to do |format|
      redirect_to flights_path
      format.js
    end
  end

  private
  # def set_airline
 #      @airline = Airline.find(params[:airline_id])
  # end
  # def is_admin?
 #      current_user.role.code == 'employee'
 #    end

  def flight_params
    params.require(:flight).permit(:name,:source,:destination,:status,:airline_id)
  end
end
