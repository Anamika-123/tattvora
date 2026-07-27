FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "Anamika@123" }
    role { student }
  end
end
