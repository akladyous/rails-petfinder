module ApplicationHelper
  def feedback_for?(object, attribute)
    return nil if object.errors.empty?

    if object.errors.has_key?(attribute)
      return content_tag :div, nil, { class: %w[d-block invalid-feedback] } do
        object.errors.full_messages_for(attribute).to_sentence
      end
    end
    nil
  end

  def input_selector(model, attribute)
    attribute = attribute.is_a?(String) ? attribute.to_sym : attribute
    model.public_send(attribute).map { |k, _| [k.capitalize, k] }
    # model.public_send(attribute.pluralize.to_sym).map { |k, _| [k.capitalize, k] }
  end
end
