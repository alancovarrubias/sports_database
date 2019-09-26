require 'rails_helper'

RSpec.describe Team, type: :model do
  it "is valid with a season, name, abbr, city" do
    expect(FactoryBot.build(:team)).to be_valid
  end

  it "is invalid without a season" do
    expect(FactoryBot.build(:team, season: nil)).to_not be_valid
  end

  it "is invalid without a name" do
    expect(FactoryBot.build(:team, name: nil)).to_not be_valid
  end

  it "is invalid without a abbr" do
    expect(FactoryBot.build(:team, abbr: nil)).to_not be_valid
  end

  it "is invalid without a city" do
    expect(FactoryBot.build(:team, city: nil)).to_not be_valid
  end

  describe "same season duplicates" do
    before do
      @season = FactoryBot.create(:season)
    end

    it "does not allow duplicate names per season" do
      FactoryBot.create(:team, season: @season, name: "name")
      team = FactoryBot.build(:team, season: @season, name: "name")
      team.valid?
      expect(team.errors[:name]).to include("has already been taken")
    end

    it "does not allow duplicate abbrs per season" do
      FactoryBot.create(:team, season: @season, abbr: "abbr")
      team = FactoryBot.build(:team, season: @season, abbr: "abbr")
      team.valid?
      expect(team.errors[:abbr]).to include("has already been taken")
    end

    it "allows duplicate cities per season" do
      FactoryBot.create(:team, season: @season, city: "city")
      expect(FactoryBot.build(:team, season: @season, city: "city")).to be_valid
    end
  end

  describe "different season duplicates" do
    it "allows duplicate names with different seasons" do
      FactoryBot.create(:team, name: "name")
      expect(FactoryBot.build(:team, name: "name")).to be_valid
    end

    it "allows duplicate abbrs with different seasons" do
      FactoryBot.create(:team, abbr: "abbr")
      expect(FactoryBot.build(:team, abbr: "abbr")).to be_valid
    end
  end
end
