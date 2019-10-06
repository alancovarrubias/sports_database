require 'rails_helper'

RSpec.describe TeamStat, type: :model do
  it "FactoryBot is valid" do
    expect(FactoryBot.build(:team_stat, :with_opp)).to be_valid
  end

  describe "associations" do
    it { should belong_to(:season) }
    it { should belong_to(:team) }
    it { should belong_to(:game) }
    it { should belong_to(:opp).class_name("TeamStat") }
  end
end
