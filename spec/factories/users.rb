FactoryGirl.define do
  factory :user do
    name "Test User"
    sequence(:email) {|n| "test#{n}@user.com" }
    password "password"
  end
end
