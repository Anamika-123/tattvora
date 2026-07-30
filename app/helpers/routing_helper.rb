module RoutingHelper

  def role_base_dashboard_path(user_role)
   case user_role
    when "student"
      dashboard_student_path
    when "teacher"
      dashboard_teacher_path
    when "admin"
      dashboard_admin_path
    end
  end
end
