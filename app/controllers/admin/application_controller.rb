# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    impersonates :user
    before_action :authenticate_user!

    protected

    def after_sign_out_path_for(scope)
      home_index_path
    end
  end
end
