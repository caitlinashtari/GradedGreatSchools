require 'rails_helper'

RSpec.describe "schools/index", type: :view do
  before(:each) do
    assign(:schools, [
      School.create!(
        :latitude => 2.5,
        :longitude => 3.5,
        :address => "Address",
        :text => "Text",
        :description => "MyText",
        :zip => 4
      ),
      School.create!(
        :latitude => 2.5,
        :longitude => 3.5,
        :address => "Address",
        :text => "Text",
        :description => "MyText",
        :zip => 4
      )
    ])
  end

  it "renders a list of schools" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
