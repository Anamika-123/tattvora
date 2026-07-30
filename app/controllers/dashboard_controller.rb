class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to role_base_dashboard_path(current_user.role)
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
