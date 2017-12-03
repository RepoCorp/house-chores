FactoryGirl.define do
  factory :scheduled_chore do
    user
    chore
    monday true
    active true
  end
end
