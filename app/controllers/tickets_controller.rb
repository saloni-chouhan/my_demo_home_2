class TicketsController < ApplicationController
	before_action :authenticate_user!, except:[:index,:show]
	def new
		@ticket = Ticket.new
	end

	def index
		 @tickets = Ticket.all
        if params[:search]
            @search = params[:search]
            @tickets = @tickets.search_by(@search)
        else
            @tickets = Ticket.all
        end
	end

	def create
		@ticket = Ticket.create(ticket_params)

		if @ticket.save
			redirect_to ticket_path(@ticket)
		else
			render 'new'
		end
	end

	def show
		@ticket = Ticket.find(params[:id])
	end

	def edit
		@ticket = Ticket.find(params[:id])
	end

	def update
		@ticket = Ticket.find(params[:id])

		if @ticket.update(ticket_params)
			redirect_to tickets_path
		else
			render 'edit'
		end
	end

	def destroy
		@ticket = Ticket.find(params[:id])

		@ticket.destroy
		redirect_to tickets_path
	end

	private 
	def ticket_params
		params.require(:ticket).permit(:seatno, :class_type, :source, :destination, :flight_id)
	end
end
