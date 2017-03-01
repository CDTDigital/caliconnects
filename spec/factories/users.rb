FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}user@example.com" }
    phone "4155555555"
    password "jillsecret"
    first_name "jill"
    last_name "secret"
  end
end
