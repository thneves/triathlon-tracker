FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'foobar' }
  end

  factory :track do
    sport { "Run" }
    day { "10-10-2001" }
    moving_time { 2500 }
    distance { 10 }
    user
  end
end