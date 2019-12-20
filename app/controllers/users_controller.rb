class UsersController < ApplicationController
  include PresenterConcern
  before_action :set_user
  layout 'main_layout'

  def index
    @employee = @user.employee
    @employee = present(@employee)
    unless @employee
      redirect_to root_path
    end
  end

  def impersonate
    if @user.has_role? :Super
      user = User.find(params[:id])
      impersonate_user(user)
    end
    redirect_to root_path
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to root_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.fetch(:user, {}).permit(:id)
  end
end
