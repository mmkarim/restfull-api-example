FactoryGirl.define do
  factory :information do
    url Faker::Internet.url
    content Faker::Lorem.paragraph
  end
end
