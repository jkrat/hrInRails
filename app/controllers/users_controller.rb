class UsersController < ApplicationController
  include PresenterConcern
  before_action :set_user
  layout 'main_layout'

  def dashboard
    @employee = @user.employee
    @employee = present(@employee)
    if not @employee
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
