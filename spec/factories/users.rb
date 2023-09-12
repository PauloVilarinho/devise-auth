FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :admin do
      role { "admin" }
    end

    trait :publisher do
      role { "publisher" }
    end
  end
end
