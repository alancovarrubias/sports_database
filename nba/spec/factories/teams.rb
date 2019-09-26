FactoryBot.define do
  factory :team do
    association :season
    sequence(:name) { |n| "name#{n}" }
    sequence(:abbr) { |n| "abbr#{n}" }
    sequence(:city) { |n| "city#{n}" }
  end
end
