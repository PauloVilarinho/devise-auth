require "rails_helper"

RSpec.describe "Registration", type: :request do
  describe "POST #create" do
    context "with normal user doing sign up" do
      it "should not allow to select a role" do

        post "/users", params: {
          user: {
            email: "teste@teste.com",
            password: "123456",
            password_confirmation: "123456",
            role: "admin"
          }
        }

        expect(User.last.role).not_to eq("admin")
      end
    end

    context "with normal user doing sign up" do
      it "should not allow to select a role" do
        admin = create(:user, role: "admin")
        sign_in admin

        post "/users", params: {
          user: {
            email: "teste@teste.com",
            password: "123456",
            password_confirmation: "123456",
            role: "admin"
          }
        }

        expect(User.last.role).to eq("admin")
      end
    end
  end
end
