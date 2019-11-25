class HomeController < ApplicationController
  before_action :authenticate_user!
  layout false

  def index
    redirect_to employees_path
  end
end
