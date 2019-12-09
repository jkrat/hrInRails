module ApplicationHelper
  include FlashHelper

  def full_name
    "#{@employee.first_name} #{@employee.last_name}"
  end
end

