require 'rails_helper'

RSpec.describe Season, type: :model do
  it "FactoryBot is valid" do
    expect(FactoryBot.build(:season)).to be_valid
  end

  describe "associations" do
    it { should have_many(:teams).dependent(:destroy) }
    it { should have_many(:players).dependent(:destroy) }
    it { should have_many(:games).dependent(:destroy) }
    it { should have_many(:team_stats).dependent(:destroy) }
    it { should have_many(:player_stats).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:year) }
    it { should validate_uniqueness_of(:year) }
  end
end
