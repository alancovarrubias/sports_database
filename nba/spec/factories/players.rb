FactoryBot.define do
  factory :player do
    association :season
    association :team
    name { "name" }
    sequence(:abbr) { |n| "abbr#{n}" }
  end
end
