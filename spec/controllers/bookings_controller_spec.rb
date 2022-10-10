describe BookingsController, type: :controller do
	it "renders on the index page" do
		get :index
		expect(response).to render_template("bookings/index")
	end
end 