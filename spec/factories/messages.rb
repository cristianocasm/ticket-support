FactoryGirl.define do
  factory :message do
    msg { Faker::ChuckNorris.fact }
    ticket
    agent
  end
end
