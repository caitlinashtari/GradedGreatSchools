require 'rails_helper'

RSpec.describe "schools/edit", type: :view do
  before(:each) do
    @school = assign(:school, School.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "MyString",
      :text => "MyString",
      :description => "MyText",
      :zip => 1
    ))
  end

  it "renders the edit school form" do
    render

    assert_select "form[action=?][method=?]", school_path(@school), "post" do

      assert_select "input#school_latitude[name=?]", "school[latitude]"

      assert_select "input#school_longitude[name=?]", "school[longitude]"

      assert_select "input#school_address[name=?]", "school[address]"

      assert_select "input#school_text[name=?]", "school[text]"

      assert_select "textarea#school_description[name=?]", "school[description]"

      assert_select "input#school_zip[name=?]", "school[zip]"
    end
  end
end
