module PresenterConcern
  extend ActiveSupport::Concern

  def present(model, view = view_context, presenter_class = nil)
    models = Array.wrap(model)
    return models if models.empty?

    klass = presenter_class || "#{models.first.class}Presenter".constantize
    presenters = models.map { |m| klass.new(m, view) }
    presenters.size == 1 ? presenters.first : presenters
  end

end


