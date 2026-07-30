class DashboardPolicy < ApplicationPolicy
  def student?
    student_user?
  end

  def teacher?
    teacher_user?
  end

  def admin?
    admin_user?
  end
end
