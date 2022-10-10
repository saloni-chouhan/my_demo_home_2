describe FlightsController, type: :controller do
	it "returns the List of Flights" do 
		get :index
		expect(response).to render_template("index")
	end

    # it "returns a 200" do
    #   request.headers["Authorization"] = "foo"
    #   get :show
    #   expect(response).to have_http_status(:ok)
    # end
    
end