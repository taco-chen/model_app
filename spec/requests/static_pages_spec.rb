require 'spec_helper'

describe "Static Pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Model App') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '| Home')}

    describe "after click sign up button" do
      before { click_link "Sign up" }

      it { should have_selector('title', text: 'Sign up') }
    end
  end

  describe "Help page" do
    before { visit help_path }

  	it { should have_selector('h1', text: 'Help') }
  	it { should have_selector('title', text: full_title('Help')) }
  end

end
