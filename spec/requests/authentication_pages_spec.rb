require 'rails_helper'

RSpec.describe "Authentication", type: :request do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { is_expected.to have_content('Sign in') }
    it { is_expected.to have_title('Sign in') }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { is_expected.to have_title('Sign in') }
      it { is_expected.to have_selector('div.alert.alert-error') }
    end
  end
end
