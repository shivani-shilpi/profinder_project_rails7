require 'rails_helper'

RSpec.describe "images/show", type: :view do
  before(:each) do
    assign(:image, Image.create!(
      data_uri: "Data Uri"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Data Uri/)
  end
end
