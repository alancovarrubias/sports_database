FactoryBot.define do
  factory :game do
    association :season
    association :game_day
    association :away_team, factory: :team
    association :home_team, factory: :team
  end
end
