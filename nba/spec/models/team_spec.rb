require 'rails_helper'

RSpec.describe Team, type: :model do
  it "is valid with a season, name, abbr, city" do
    expect(FactoryBot.build(:team)).to be_valid
  end

  describe "associations" do
    it { should belong_to(:season) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:abbr) }
    it { should validate_presence_of(:city) }
    it { should validate_uniqueness_of(:name).scoped_to(:season_id) }
    it { should validate_uniqueness_of(:abbr).scoped_to(:season_id) }
  end
end
