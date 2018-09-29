require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }

  it { is_expected.to be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { is_expected.not_to be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { is_expected.not_to be_valid }
  end
end
