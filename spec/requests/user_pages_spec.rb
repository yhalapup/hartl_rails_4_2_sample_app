require 'rails_helper'

RSpec.describe "UserPages", type: :request do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect do
          click_button submit
        end.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect do
          click_button submit
        end.to change(User, :count).by(1)
      end
    end

    it { is_expected.to have_content('Sign up') }
    it { is_expected.to have_title('Sign up') }
  end

  describe "profile page" do
    let(:user) { FactoryBot.create(:user) }
    before { visit user_path(user) }

    it { is_expected.to have_content(user.name) }
    it { is_expected.to have_title(user.name) }
  end
end
