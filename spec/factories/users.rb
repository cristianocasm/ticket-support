FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '123456'
  end

  factory :agent, parent: :user, class: User::Agent do
    factory :admin do
      admin true
    end
  end
  
  factory :customer, parent: :user, class: User::Customer do; end
end
