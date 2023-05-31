require 'rails_helper'

RSpec.describe "mailers/show", type: :view do
  before(:each) do
    assign(:mailer, Mailer.create!(
      to: "MyText",
      subject: "Subject",
      body: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
  end
end
