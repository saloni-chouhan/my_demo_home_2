require 'rails_helper'

describe BookingsController do
	describe "get Index" do
		it "renders the index template" do
        get :index
        expect(response).to render_template("index")
        end
	end
end