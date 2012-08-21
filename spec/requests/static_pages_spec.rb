require 'spec_helper'

describe "Static Pages" do
  describe "Home page" do
    it "should have the content 'Model App'" do
    	visit '/static_pages/home'
    	page.should have_content('Model App')
    end

    it "should have the right title" do
    	visit '/static_pages/home'
    	page.should have_selector('title', text: "Model App | Home")
    end
  end

  describe "Help page" do
  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
  		page.should have_content('Help')
  	end

  	it "should have the right title" do
    	visit '/static_pages/help'
    	page.should have_selector('title', text: "Model App | Help")
  	end
  end

end
