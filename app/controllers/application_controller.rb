class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    admin_path
  end

  def prepare_meta_tags(options = {})
    title       = options[:title].truncate(70)
    description = options[:description].present? ? ActionView::Base.full_sanitizer.sanitize(options[:description]) : "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Quisque velit nisi, pretium ut lacinia in, id enim."

    description = description.delete("&#13;").truncate(160)
    options[:description] = description

    defaults = {
      title:       title,
      image:       options[:image],
      description: description,

      twitter:     {title:       title,
                    description: description,
                    image:       options[:image]},
      og:
                   {title:       title,
                    description: description,
                    image:       options[:image]},
    }

    options.reverse_merge!(defaults)
    set_meta_tags options

  end
end
