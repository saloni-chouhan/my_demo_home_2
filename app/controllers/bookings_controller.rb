class BookingsController < ApplicationController
	# before_action :add_id
	def new
		@book = Booking.new
	end

	def create
		@book = current_user.bookings.new(booking_params)

		if @book.save
			redirect_to booking_path(@book)
		else
			render 'new'
		end
	end

	def index
		if current_user.role.code == "admin"
			@books = Booking.all
		else
		 @books = current_user.bookings.all
        if params[:search]
            @search = params[:search]
            @books = @books.search_by(@search)
        else
            @books = current_user.bookings.all
        end
    end
	end

	def show
		@book = Booking.find(params[:id])
	end

	def edit
		@book = current_user.bookings.find(params[:id])
	end

	def update
		@book = current_user.bookings.find(params[:id])

		if @book.update(booking_params)
			redirect_to bookings_path
		else
			render 'edit'
		end
	end

	def destroy
		@book = Booking.find(params[:id])
        @book.destroy
        redirect_to bookings_path
	end

    # def search
    # 	if params[:search].blank?
    # 		redirect_to bookings_path and return
    # 	else
    # 		@parameter = params[:search].downcase
    # 		@results = Booking.all.where("lower(name_of_passenger) LIKE :search", search: "%#{@parameter}%")
    # 	end
    # end

    # def search
    # 	@query = params[:query]
    # 	@results = Booking.where("bookings.name_of_passenger LIKE ?", ["%#{@query}%"])
    # 	render 'index'
    # end

	private
	def booking_params
		params.require(:booking).permit(:name_of_passenger, :price, :source, :destination, :passport_no, :address, :class_type, :age, :phone, :email, :ticket_id)
	end

	# def add_id
 #    	user_id = self.current_user
 #    end
	
end
