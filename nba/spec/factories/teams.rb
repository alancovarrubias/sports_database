FactoryBot.define do
  factory :team do
    association :season
    sequence(:name) { |n| "name#{n}" }
    sequence(:abbr) { |n| "abbr#{n}" }
    city { "city" }
  end
end
