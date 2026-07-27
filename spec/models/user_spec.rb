require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    describe "email" do
      it "is invalid without an email" do
        user = User.new(
          email: nil,
          password: "Password@123"
        )
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "accepts a valid email address" do
        user = User.new(
          email: "anamika.sharma@example.com",
          password: "Password@123"
        )
        expect(user).to be_valid
      end

      it "reject an invalid email address" do
        user = User.new(
          email: "@anamika.com",
          password: "Password@123"
        )
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("is invalid")
      end

      it "checks email uniqueness" do
        User.create!(
          email: "anamika@example.com",
          password: "Password@123"
        )

        duplicate_user = User.new(
          email: "anamika@example.com",
          password: "password@123"
        )
        expect(duplicate_user).not_to be_valid
        expect(duplicate_user.errors[:email]).to include("has already been taken")
      end

      it "downcase the email before validation" do
        user = User.create!(
          email: "ANAMIKA@GMAIL.COM",
          password: "Anamika@123"
        )

        expect(user.email).to eq("anamika@gmail.com")
      end
    end

    describe "password" do
      it "is invalid without a password" do
        user = User.new(
          email: "anamika@example.com",
          password: ""
        )
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "accepts a strong password" do
        user = User.new(
          email: "anamika@example.com",
          password: "Anamika@123"
        )
        expect(user).to be_valid
      end

      it "should rejects an invalid password" do
        user = User.new(
          email: "anamika@example.com",
          password: "anamika123"
        )
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include("must include at least one lowercase letter, one uppercase letter, one digit, and one special character")
      end
    end
  end

  describe "authorization" do
    describe "roles" do
      it "user has default student role" do
        user = User.new
        expect(user.role).to eq("student")
      end

      it "allows user to have student role" do
        user = User.new(role: :student)
        expect(user.student?).to be(true)
      end

      it "allows user to have teacher role" do
        user = User.new(role: :teacher)
        expect(user.teacher?).to be(true)
      end

      it "allows user to have an admin role" do
        user = User.new(role: :admin)
        expect(user.admin?).to be(true)
      end
    end
  end
end
