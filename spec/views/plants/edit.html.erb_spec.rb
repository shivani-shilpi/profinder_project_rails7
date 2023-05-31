require 'rails_helper'

RSpec.describe "plants/edit", type: :view do
  let(:plant) {
    Plant.create!(
      name: "MyString",
      price: 1
    )
  }

  before(:each) do
    assign(:plant, plant)
  end

  it "renders the edit plant form" do
    render

    assert_select "form[action=?][method=?]", plant_path(plant), "post" do

      assert_select "input[name=?]", "plant[name]"

      assert_select "input[name=?]", "plant[price]"
    end
  end
end
