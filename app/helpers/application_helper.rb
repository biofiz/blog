module ApplicationHelper
  def full_title(page_title = '')
    base_title = "My blog"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def flash_class(flash_type)
    bootstrap_classes = {
        success: "alert-success",
        error: "alert-danger",
        alert: "alert-warning",
        notice: "alert-info"
    }
    bootstrap_classes[flash_type.to_sym]
  end

  def flash_messages
    messages = ''
    flash.each do |key, value|
      messages += content_tag(:div, value, class: "alert #{flash_class(key)} dismiss")
    end
    messages.html_safe
  end
end
