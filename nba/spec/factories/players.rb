FactoryBot.define do
  factory :player do
    association :season
    association :team
    name { "name" }
    abbr { "abbr" }
    sequence(:idstr) { |n| "idstr#{n}" }
  end
end
