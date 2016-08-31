FactoryGirl.define do
  factory :chuck_norris do
    fact { Faker::ChuckNorris.fact }
    knockouts { rand(0..100) }
  end
end
