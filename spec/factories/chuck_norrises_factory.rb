FactoryGirl.define do
  factory :chuck_norris do
    kungfu { {fact: Faker::ChuckNorris.fact, knockouts: rand(1..100)} }
  end
end
