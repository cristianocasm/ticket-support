FactoryGirl.define do
  factory :ticket do
    title { Faker::ChuckNorris.fact }
    customer
  end
end
