require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :tree do
    sequence(:title) {|n| "Awesome Tree 900#{n}" }
    description 'The most awesome tree ever!!!'

    user
  end

end
