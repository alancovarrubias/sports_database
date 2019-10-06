require 'rails_helper'

RSpec.describe GameDay, type: :model do
  it "FactoryBot is valid" do
    expect(FactoryBot.build(:game_day)).to be_valid
  end

  describe "associations" do
    it { should belong_to(:season) }
    it { should have_many(:games) }
  end

  describe "validations" do
    it { should validate_presence_of(:date) }
  end
end
