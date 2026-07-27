class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    case current_user.role
    when "student"
      redirect_to dashboard_student_path
    when "teacher"
      redirect_to dashboard_teacher_path
    when "admin"
      redirect_to dashboard_admin_path
    else
      redirect_to root_path, alert: "Invalid user role."
    end
  end

  def student
    authorize :dashboard, :student?
  end

  def teacher
    authorize :dashboard, :teacher?
  end

  def admin
    authorize :dashboard, :admin?
  end
end
