FactoryBot.define do
  factory :team_stat do
    association :season
    association :team
    association :game
    trait :with_opp do
      association :opp, factory: :team_stat
    end
  end
end
