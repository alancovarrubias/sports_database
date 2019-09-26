FactoryBot.define do
  factory :stat do
    association :season
    association :game
    factory :team_stat do
      association :model, factory: :team
    end
    factory :player_stat do
      association :model, factory: :team
    end
  end
end
