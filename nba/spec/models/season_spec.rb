require 'rails_helper'

RSpec.describe Season, type: :model do
  it "is valid with a year" do
    expect(FactoryBot.build(:season)).to be_valid
  end

  it "is invalid without a year" do
    season = FactoryBot.build(:season, year: nil)
    season.valid?
    expect(season.errors[:year]).to include("can't be blank")
  end

  it "is invalid with a duplicate year" do
    FactoryBot.create(:season, year: 2000)
    season = FactoryBot.build(:season, year: 2000)
    season.valid?
    expect(season.errors[:year]).to include("has already been taken")
  end
end
