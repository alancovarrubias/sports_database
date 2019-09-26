require 'rails_helper'

RSpec.describe Player, type: :model do
  it "FactoryBot is valid" do
    expect(FactoryBot.build(:player)).to be_valid
  end

  describe "associations" do
    it { should belong_to(:season) }
    it { should belong_to(:team) }
    it { should have_many(:stats).dependent(:destroy) }
  end

  describe "validations" do
    it  { should validate_presence_of(:name) }
    it  { should validate_presence_of(:abbr) }
    it  { should validate_presence_of(:idstr) }
    it  { should validate_uniqueness_of(:idstr).scoped_to(:season_id) }
  end
end
