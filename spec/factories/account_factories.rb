FactoryGirl.define do
  factory :account do 
    sequence(:subdomain){|n| "account-#{n}"}
  end
end
