require 'rails_helper'

RSpec.describe "plants/show", type: :view do
  before(:each) do
    assign(:plant, Plant.create!(
      name: "Name",
      price: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
