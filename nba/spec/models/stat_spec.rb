require 'rails_helper'

RSpec.describe Stat, type: :model do
  it "FactoryBot is valid" do
    expect(FactoryBot.build(:team_stat)).to be_valid
    expect(FactoryBot.build(:player_stat)).to be_valid
  end

  describe "associations" do
    it { should belong_to(:season) }
    it { should belong_to(:game) }
    it { should belong_to(:model) }
    it { should belong_to(:team).with_foreign_key(:model_id).optional }
    it { should belong_to(:player).with_foreign_key(:model_id).optional }
  end
end
