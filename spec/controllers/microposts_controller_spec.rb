require 'spec_helper'

describe MicropostsController do
	
	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "delete a micropost via Ajax" do
		let(:micropost) { user.microposts.build(content: "hi") }

		before { micropost.save }
		
		it "should decrement user's micrposts count" do
			expect do
				xhr :delete, :destroy, id: micropost.id
			end.should change(Micropost, :count).by(-1)
		end

		it "should respond with success" do
			xhr :delete, :destroy, id: micropost.id
			response.should be_success
		end

	end

end