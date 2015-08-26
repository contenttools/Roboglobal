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
    original_date.strftime('%d %b %Y')
  end

  def add_admin_class
    "white-header" if request.original_url =~ /admin/
  end

  def submit_text(object, action)
    return ["Update ", action].join if object.persisted?
    return ["Add ", action].join
  end

  def show_archive(archive)
    "#{Date::MONTHNAMES[archive[0][1]]}, #{archive[0][0]} (#{archive[1]})"
  end
end
