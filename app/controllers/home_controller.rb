class HomeController < ApplicationController
  def index
    redirect_to employees_path
  end
end
