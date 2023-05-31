require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        data_uri: "Data Uri"
      ),
      Image.create!(
        data_uri: "Data Uri"
      )
    ])
  end

  it "renders a list of images" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Data Uri".to_s), count: 2
  end
end
