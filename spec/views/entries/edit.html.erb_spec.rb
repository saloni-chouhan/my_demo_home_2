require 'rails_helper'

RSpec.describe "entries/edit", type: :view do
  before(:each) do
    @entry = assign(:entry, Entry.create!(
      :name => "MyString",
      :address => "MyText",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit entry form" do
    render

    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do

      assert_select "input[name=?]", "entry[name]"

      assert_select "textarea[name=?]", "entry[address]"

      assert_select "input[name=?]", "entry[phone]"

      assert_select "input[name=?]", "entry[email]"
    end
  end
end
