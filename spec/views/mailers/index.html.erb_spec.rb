require 'rails_helper'

RSpec.describe "mailers/index", type: :view do
  before(:each) do
    assign(:mailers, [
      Mailer.create!(
        to: "MyText",
        subject: "Subject",
        body: "MyText"
      ),
      Mailer.create!(
        to: "MyText",
        subject: "Subject",
        body: "MyText"
      )
    ])
  end

  it "renders a list of mailers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Subject".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
