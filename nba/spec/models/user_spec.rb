require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, last name, email, and password_digest" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  describe "validations" do
    it { should have_secure_password }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  it "returns a user's full name as a string" do
    user = FactoryBot.build(:user, first_name: "John", last_name: "Doe")
    expect(user.name).to eq "John Doe"
  end
end
