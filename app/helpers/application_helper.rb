module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def feedback_for?(object, attribute)
    return nil if object.errors.empty?

    if object.errors.has_key?(attribute)
      return content_tag :div, nil, { class: %w[d-block invalid-feedback] } do
        object.errors.full_messages_for(attribute).to_sentence
      end
    end
    nil
  end

  def inline_error_for(object, attribute)
    html = []
    if object.errors[attribute].any?
      html << object.errors[attribute].each do |msg|
        tag.div(msg, class: 'come class')
      end
    end
    html.join_html_safe
  end


  def input_selector(model, attribute)
    attribute = attribute.is_a?(String) ? attribute.to_sym : attribute
    model.public_send(attribute).map { |k, _| [k.capitalize, k] }
    # model.public_send(attribute.pluralize.to_sym).map { |k, _| [k.capitalize, k] }
  end

  def current_model(object)
    object.class.name.gsub('::', '').underscore
  end
  def model_name
    controller_path.classify
  end
end
