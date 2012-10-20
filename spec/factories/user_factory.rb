FactoryGirl.define do

  factory :user do
    email        Faker::Internet.email
    password     '?#p@ssw0rd123'
    confirmed_at { DateTime.now }
  end

end
