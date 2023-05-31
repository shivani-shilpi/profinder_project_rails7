require 'rails_helper'

RSpec.describe "images/edit", type: :view do
  let(:image) {
    Image.create!(
      data_uri: "MyString"
    )
  }

  before(:each) do
    assign(:image, image)
  end

  it "renders the edit image form" do
    render

    assert_select "form[action=?][method=?]", image_path(image), "post" do

      assert_select "input[name=?]", "image[data_uri]"
    end
  end
end
