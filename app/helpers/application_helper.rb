module ApplicationHelper

  def present(model, view = self, presenter_class = nil)
    models = Array.wrap(model)
    return models if models.empty?

    klass = presenter_class || "#{models.first.class}Presenter".constantize
    presenters = models.map { |m| klass.new(m, view) }
    presenters.size == 1 ? presenters.first : presenters
  end

  def ensure_array(t)
    return Array.wrap(t)
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
