require 'rails_helper'

# describe BookingsController, type: :controller do
# 	it "renders on the index page" do
# 		get :index
# 		assert_response :success
# 	end
# end 

# describe BookingsController, type: :controller do
#   describe "GET index" do
#     it "has a 200 status code" do
#       let(:user).let(:create)
#       get :index
#       expect(response.status).to eq(200)
#     end
#   end
# end	

# describe "GET bookings#index" do
#   context "when the user is an admin" do
#     it "should list name_of_passenger of all bookings" do
#       admin = create(:admin)
#       bookings = create_list(:booking, 2, user: admin)
#       login_as(admin, scope: :user)
#       visit bookings_path

#       bookings.each do |book|
#         page.should have_content(book.name_of_passenger)
#       end
#     end
#   end
# end