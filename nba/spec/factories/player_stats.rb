FactoryBot.define do
  factory :player_stat do
    association :season
    association :player
    association :game
    association :team_stat
    association :opp_team_stat, factory: :team_stat
  end
end
