class OrganizationsController < ApplicationController
  before_action :set_organization

  def dashboard

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @user = current_user
      @organization = @user.organization
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.fetch(:organization, {})
    end
end
