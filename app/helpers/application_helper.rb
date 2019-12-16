module ApplicationHelper

  def present(model, presenter_class = nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
  end

  def date_format(date)
    date.strftime('%b %d, %Y')
  end

  def date_format_with_day_of_week(date)
    date.strftime('%a, %b %d, %Y')
  end

  def full_name(employee)
    "#{employee.first_name} #{employee.last_name}"
  end
end
