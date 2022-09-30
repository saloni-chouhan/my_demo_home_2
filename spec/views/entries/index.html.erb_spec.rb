require 'rails_helper'

RSpec.describe "entries/index", type: :view do
  before(:each) do
    assign(:entries, [
      Entry.create!(
        :name => "Name",
        :address => "MyText",
        :phone => "Phone",
        :email => "Email"
      ),
      Entry.create!(
        :name => "Name",
        :address => "MyText",
        :phone => "Phone",
        :email => "Email"
      )
    ])
  end

  it "renders a list of entries" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
