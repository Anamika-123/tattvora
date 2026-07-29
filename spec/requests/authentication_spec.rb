require "rails_helper"

RSpec.describe "Authentication", type: :request do
  describe "POST /users" do
    context "with valid parameters" do
      it "creates a new user" do
        expect {
          post user_registration_path, params: {
            user: {
              email: "anamika@example.com",
              password: "Password@123",
              password_confirmation: "Password@123"
            }
          }
        }.to change(User, :count).by(1)

        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "POST /users/sign_in" do
    context "with valid credentials" do
      it "logs the user in successfully" do
        user = User.create!(
          email: "anamika@example.com",
          password: "Password@123"
        )
        post user_session_path, params: {
          user: {
            email: user.email,
            password: "Password@123"
          }
        }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid credentials" do
      it "does not log the user in" do
       user = User.create!(
        email: "anamika@gmail.com",
        password: "Password@123"
       )

        post user_session_path, params: {
          user: {
            email: user.email,
            password: "WrongPassword@123"
          }
        }
       expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when user does not exists" do
      it "does not log the user in" do
        post user_session_path, params: {
          user: {
            email: "unknown@example.com",
            password: "Password@123"
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /" do
    context "when user is not authenticated" do
      it "allow access to home page" do
        get root_path, headers: { "Accept" => "text/html" }

        expect(response).to have_http_status(:success)
      end
    end

    context "when user is authenticated" do
      it "allows access to dashboard" do
        user = User.create!(
          email: "anamika@example.com",
          password: "Password@123"
        )

        sign_in user

        get root_path, headers: { "Accept" => "text/html" }
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
