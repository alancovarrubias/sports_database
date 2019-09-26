require 'rails_helper'

RSpec.describe Season, type: :model do
  it "is valid with a year" do
    expect(FactoryBot.build(:season)).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:year) }
    it { should validate_uniqueness_of(:year) }
    it { should have_many(:teams) }
  end
end
