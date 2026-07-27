require "rails_helper"

RSpec.describe DashboardPolicy, type: :policy do
  subject(:policy) { DashboardPolicy.new(user, :dashboard) }

  context "when the user is a student" do
    let(:user) { User.new(role: :student) }

    it "allows a student to access the student dashboard" do
      expect(policy.student?).to be(true)
    end

    it "denies access to teacher dashboard" do
      expect(policy.teacher?).to be(false)
    end

    it "denies access to admin dashboard" do
      expect(policy.admin?).to be(false)
    end
  end

  context "when user is a teacher" do
    let(:user) { User.new(role: :teacher) }

    it "allows a teacher to access the teacher dashboard" do
      expect(policy.teacher?).to be(true)
    end

    it "denies access to student dashboard" do
      expect(policy.student?).to be(false)
    end

    it "denies access to admin dashboard" do
      expect(policy.admin?).to be(false)
    end
  end

  context "when user is an admin" do
    let(:user) { User.new(role: :admin) }

    it "allows an admin to access the admin dashboard" do
      expect(policy.admin?).to be(true)
    end

    it "denies access to teacher dashboard" do
      expect(policy.teacher?).to be(false)
    end

    it "denies access to student dashboard" do
      expect(policy.student?).to be(false)
    end
  end
end
