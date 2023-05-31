require 'rails_helper'

RSpec.describe "mailers/new", type: :view do
  before(:each) do
    assign(:mailer, Mailer.new(
      to: "MyText",
      subject: "MyString",
      body: "MyText"
    ))
  end

  it "renders new mailer form" do
    render

    assert_select "form[action=?][method=?]", mailers_path, "post" do

      assert_select "textarea[name=?]", "mailer[to]"

      assert_select "input[name=?]", "mailer[subject]"

      assert_select "textarea[name=?]", "mailer[body]"
    end
  end
end
