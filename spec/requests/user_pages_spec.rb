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

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { is_expected.to have_link('Sign out') }
        it { is_expected.to have_title(user.name) }
        it {
          is_expected.to have_selector(
            'div.alert.alert-success', text: 'Welcome'
          )
        }
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

  describe "edit" do
    let(:user) { FactoryBot.create(:user) }
    before { visit edit_user_path(user) }

    describe "page" do
      it { is_expected.to have_content("Update your profile") }
      it { is_expected.to have_title("Edit user") }
      it { is_expected.to have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { is_expected.to have_content('error') }
    end
  end
end
