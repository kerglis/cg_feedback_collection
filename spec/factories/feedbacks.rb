FactoryGirl.define do

  factory :feedback do
    name        { Faker::Name.name }
    email       { Faker::Internet.email }
    is_success  true
    restored_at { Time.now }
    website_url { Faker::Internet.url }
    feedback    { Faker::Lorem.sentence }
    url         { Faker::Internet.url }
  end

end
