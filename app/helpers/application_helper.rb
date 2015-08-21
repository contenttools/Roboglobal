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
end
