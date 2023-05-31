FactoryBot.define do
  factory :mailer do
    to { "MyText" }
    subject { "MyString" }
    body { "MyText" }
  end
end
