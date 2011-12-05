FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user-#{n}@email.com"}
    password "secret"
    password_confirmation "secret"
  end
end
