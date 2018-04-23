# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :class => User do
  # factory :user do
    login 'Alex'
    email 'alex@m.com'
    password '1111'
  end
end
