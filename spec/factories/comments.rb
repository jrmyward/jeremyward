require 'faker'

FactoryGirl.define do
  factory :comment do
    name Faker::Name.name
    email Faker::Internet.email
    body "Hello World"
    site_url 'example.com'
  end
end
