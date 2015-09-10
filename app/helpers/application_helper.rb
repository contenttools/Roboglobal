module ApplicationHelper
  def alert_class_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-danger',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def date_format(original_date)
    return nil unless original_date.present?
    original_date.strftime('%b %d, %Y')
  end

  def add_admin_class
    "white-header" if request.original_url =~ /admin/
  end

  def submit_text(object, action)
    return ["Update ", action].join if object.persisted?
    return ["Add ", action].join
  end

  def show_archive(archive)
    link_to "#{Date::MONTHNAMES[archive[0][1]]}, #{archive[0][0]} (#{archive[1]})", robo_news_path(month: archive[0][1], year: archive[0][0])
  end

  def field_class(resource, field_name)
    return unless resource.errors.any?
    if resource.errors[field_name]
      return "error-field".html_safe
    else
      return "".html_safe
    end
  end

  def error_message_for(resource, field_name, options = {:prepend_text => ""})
    return unless resource.errors.any?
    error_message = resource.errors[field_name]
    if error_message
      "<span class='field-error-message'>#{field_name.to_s.humanize} #{options[:prepend_text]} #{error_message.last}</span>".html_safe
    end
  end

  def headers
    html = ''
    header_content = [['Robo News', robo_news_path], ['US Index', us_index_path], ['EU Index', eu_index_path], ['About Us', about_us_path]]
    header_content.each do |header|
      html += content_tag :li, class: active_header_tab(header[1]) do
        link_to header[0], header[1]
      end
    end
    html
  end

  def active_header_tab(path)
    'active' if request.env['PATH_INFO'] == path
  end

  def dashboard_active
    'active' if request.env['PATH_INFO'] =~ /admin/
  end
end
