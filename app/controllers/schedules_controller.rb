class SchedulesController < ApplicationController
    # load_and_authorize_resource
	def new
        @schedule = Schedule.new
    end

    def index
        @schedules = Schedule.all
        if params[:search]
            @search = params[:search]
            @schedules = @schedules.search_by(@search)
        else
            @schedules = Schedule.all
        end
    end

    def create
        @schedule = Schedule.create(schedule_params)
        if @schedule.save
            redirect_to schedule_path(@schedule)
        else
            render 'new'
        end
    end

    def show
        @schedule = Schedule.find(params[:id])
    end

    def edit
        @schedule = Schedule.find(params[:id])
    end

    def update
        @schedule = Schedule.find(params[:id])

    if @schedule.update(schedule_params)
        redirect_to @schedule
    else
        render 'edit'
    end
    end

    def destroy
        @schedule = Schedule.find(params[:id])

        @schedule.destroy
        redirect_to schedules_path
    end

    private
    
    def schedule_params
        params.require(:schedule).permit(:d_time,:a_time,:duration, :flight_id)
    end

end
