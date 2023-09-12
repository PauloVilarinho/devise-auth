require 'rails_helper'

RSpec.describe "Posts", type: :feature do
  describe " GET /posts" do
    context "with no user logged in" do
      let!(:posts) {create_list(:post, 3)}

      it "should show all posts" do
        visit "/posts"

        posts.each do |post|
          expect(page).to have_content(post.title)
        end
      end

      it "should not have the delete button" do
        visit "/posts"

        expect(page).not_to have_content("Delete")
      end

      it "should not have the edit button" do
        visit "/posts"

        expect(page).not_to have_content("Edit")
      end
    end

    context "with publisher user logged in" do
      let(:user) {create(:user, :publisher)}
      let!(:user_posts) {create_list(:post, 2, user: user)}
      let!(:other_posts) {create_list(:post, 2)}

      before do
        sign_in user
      end

      it "should show all user posts" do
        visit "/posts"

        user_posts.each do |post|
          expect(page).to have_content(post.title)
        end
      end

      it "should not show posts that does not belong to the user" do
        visit "/posts"

        other_posts.each do |post|
          expect(page).not_to have_content(post.title)
        end
      end

      it "should not have the delete button" do
        visit "/posts"

        expect(page).not_to have_content("Delete")
      end

      it "should have the edit button" do
        visit "/posts"

        expect(page).to have_content("Edit")
      end
    end
  end
end
