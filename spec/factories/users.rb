# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :class => User do
    sequence(:username) { |n| "user_#{n}"}
    sequence(:email) { |n| "user_#{n}@m.com" }
    password '1111'
  end
end
