FactoryBot.define do
  factory :season do
    sequence(:year) { |n| n }
  end
end
