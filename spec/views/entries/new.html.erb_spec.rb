require 'rails_helper'

RSpec.describe "entries/new", type: :view do
  before(:each) do
    assign(:entry, Entry.new(
      :name => "MyString",
      :address => "MyText",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new entry form" do
    render

    assert_select "form[action=?][method=?]", entries_path, "post" do

      assert_select "input[name=?]", "entry[name]"

      assert_select "textarea[name=?]", "entry[address]"

      assert_select "input[name=?]", "entry[phone]"

      assert_select "input[name=?]", "entry[email]"
    end
  end
end
