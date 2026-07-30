require "rails_helper"

RSpec.describe "Authorization", type: :request do
  describe "GET /dashboard" do
    context "when user is logged in as student" do
      let(:user) { create(:user, role: :student) }

      before do
        sign_in user
      end

      it "redirects to student dashboard" do
        get dashboard_path

        expect(response).to redirect_to(dashboard_student_path)
      end

      it "allows access to student dashboard" do
        get dashboard_student_path

        expect(response).to have_http_status(:success)
      end

      it "redirects student user from teacher dashboard" do
        get dashboard_teacher_path

        expect(response).to redirect_to(dashboard_student_path)
        expect(flash[:alert]).to eq("You are not authorized to perform this action")
      end

      it "redirects student user from admin dashboard" do
        get dashboard_admin_path

        expect(response).to redirect_to(dashboard_student_path)
        expect(flash[:alert]).to eq("You are not authorized to perform this action")
      end
    end

    context "when user is logged in as teacher" do
      let(:user) { create(:user, role: :teacher) }

      before do
        sign_in user
      end

      it "redirects to teacher dashboard" do
        get dashboard_path

        expect(response).to redirect_to(dashboard_teacher_path)
      end

      it "allows access to teacher dashboard" do
        get dashboard_teacher_path

        expect(response).to have_http_status(:success)
      end

      it "redirects teacher user from student dashboard" do
        get dashboard_student_path

        expect(response).to redirect_to(dashboard_teacher_path)
        expect(flash[:alert]).to eq("You are not authorized to perform this action")
      end

      it "redirects teacher user from admin dashboard" do
        get dashboard_admin_path

        expect(response).to redirect_to(dashboard_teacher_path)
        expect(flash[:alert]).to eq("You are not authorized to perform this action")
      end
    end

    context "when user is logged in as admin" do
      let(:user) { create(:user, role: :admin) }

      before do
        sign_in user
      end

      it "redirects to admin dashboard" do
        get dashboard_path

        expect(response).to redirect_to(dashboard_admin_path)
      end

      it "allows access to admin dashboard" do
        get dashboard_admin_path

        expect(response).to have_http_status(:success)
      end

      it "redirects admin user from student dashboard" do
        get dashboard_student_path

        expect(response).to redirect_to(dashboard_admin_path)
        expect(flash[:alert]).to eq("You are not authorized to perform this action")
      end

      it "redirects admin user from teacher dashboard" do
        get dashboard_teacher_path

        expect(response).to redirect_to(dashboard_admin_path)
        expect(flash[:alert]).to eq("You are not authorized to perform this action")
      end
    end
  end
end
