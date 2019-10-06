require 'rails_helper'

RSpec.describe PlayerStat, type: :model do
  it "FactoryBot is valid" do
    expect(FactoryBot.build(:player_stat)).to be_valid
  end

  describe "associations" do
    it { should belong_to(:player) }
    it { should belong_to(:season) }
    it { should belong_to(:game) }
    it { should belong_to(:team_stat) }
    it { should belong_to(:opp_team_stat).class_name("TeamStat") }
  end
end
