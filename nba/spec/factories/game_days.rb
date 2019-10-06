FactoryBot.define do
  factory :game_day do
    association :season
    date { Date.today }
  end
end
