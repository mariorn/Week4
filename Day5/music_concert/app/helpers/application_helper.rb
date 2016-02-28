module ApplicationHelper


  def flash_message(element)
    get_message(:alert) || get_message(:notice)
  end

  def errors_messages(element)
    get_error(element.errors) if element.errors.any?
  end


  private

  def get_message(type)
    if(flash[type])
      content_tag :div, class: type do
        content_tag :p do
          flash[type]
        end
      end
    end
  end

  def get_error(errors)
    errors.full_messages.each do |error| 
      content_tag :ul, class: type do
        content_tag :li do
          error
        end
      end
    end
  end


end
