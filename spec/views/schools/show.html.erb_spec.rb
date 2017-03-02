require 'rails_helper'

RSpec.describe "schools/show", type: :view do
  before(:each) do
    @school = assign(:school, School.create!(
      :latitude => 2.5,
      :longitude => 3.5,
      :address => "Address",
      :text => "Text",
      :description => "MyText",
      :zip => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/4/)
  end
end
