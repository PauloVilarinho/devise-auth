require "rails_helper"

describe PostPolicy do
  describe "create?" do
    context "with publisher user" do
      let(:user) {create(:user, :publisher)}

      it "should allow to create a post" do
        policy = PostPolicy.new(user, Post.new)
        expect(policy.create?).to be_truthy
      end
    end
  end
end
