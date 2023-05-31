require 'rails_helper'

RSpec.describe "mailers/edit", type: :view do
  let(:mailer) {
    Mailer.create!(
      to: "MyText",
      subject: "MyString",
      body: "MyText"
    )
  }

  before(:each) do
    assign(:mailer, mailer)
  end

  it "renders the edit mailer form" do
    render

    assert_select "form[action=?][method=?]", mailer_path(mailer), "post" do

      assert_select "textarea[name=?]", "mailer[to]"

      assert_select "input[name=?]", "mailer[subject]"

      assert_select "textarea[name=?]", "mailer[body]"
    end
  end
end
