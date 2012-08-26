require 'spec_helper'

describe "Static Pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Desiring Talks') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '| Home')}

    describe "after click sign up button" do
      before { click_link "Sign up" }

      it { should have_selector('title', text: 'Sign up') }
    end

    describe "for signed-in users" do
      let(:user) { Factory.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "xxxxxxxxx")
        FactoryGirl.create(:micropost, user: user, content: "kadfjakfjdka")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "should have the microposts count" do
        it { should have_selector("a", text: user.microposts.count.to_s) }
      end

      describe "should have the follower/following count" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end

  describe "Help page" do
    before { visit help_path }

  	it { should have_selector('h1', text: 'Help') }
  	it { should have_selector('title', text: full_title('Help')) }
  end

end
