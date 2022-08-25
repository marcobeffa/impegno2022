module ApplicationHelper
  def render_svg(name, options={})
    options[:title] ||= name.underscore.humanize
    options[:aria] = true
    options[:nocomment] = true
    options[:class] = options.fetch(:styles, "fill-current text-gray-500")
    filename = "#{name}.svg"
    inline_svg_tag(filename, options)
  end
  
  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
    Markdown.new(text, *options).to_html.html_safe
  end

  def author_of?(resource)
    user_signed_in? && current_user.profile.id == resource.profile_id ||
    user_signed_in? && current_user.admin?
  end

  def gravatar_for(user, options={})
    classes = options[:class]
    if user.avatar_url
      gravatar_url = user.avatar_url
    else
      gravatar_id = Digest::MD5::hexdigest(user.user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    end
    image_tag(gravatar_url, alt: user.username, class: classes)
  end

  def icon_delete
    icon = '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
      <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
      </svg>'
    icon
  end
  def icon_back
    icon = '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
      <path stroke-linecap="round" stroke-linejoin="round" d="M11 15l-3-3m0 0l3-3m-3 3h8M3 12a9 9 0 1118 0 9 9 0 01-18 0z" />
    </svg>'
    icon
  end 
  def icon_edit
    icon = ' <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
      </svg>'
    icon
  end
  def icon_search
    icon = '<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
    <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
  </svg>'
    icon
  end
  

  def icon_lock
    icon = '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
    <path stroke-linecap="round" stroke-linejoin="round" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
  </svg>'
  end

  def icon_impegno
    icon =  '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
    <path stroke-linecap="round" stroke-linejoin="round" d="M9 13h6m-3-3v6m5 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
  </svg>'

  end


  def helper_day(number_day_of_week) 
    if number_day_of_week == 1
      "Lunedì"
    elsif number_day_of_week == 2
      "Martedì"
    elsif number_day_of_week == 3
      "Mercoledì"
    elsif number_day_of_week == 4
      "Giovedì"
    elsif number_day_of_week == 5
      "Venerdì"
    elsif number_day_of_week == 6
      "Sabato"
    else
      "Domenica"
    end
  end

  def helper_month(n_day_of_m)
    if n_day_of_m == 1
      "Gennaio"
    elsif n_day_of_m == 2
      "Febbraio"
    elsif n_day_of_m == 3
      "Marzo"
    elsif n_day_of_m == 4
      "Aprile"
    elsif n_day_of_m == 5
      "Maggio"
    elsif n_day_of_m == 6
      "Giugno"
    elsif n_day_of_m == 7
      "Luglio"
    elsif n_day_of_m == 8
      "Agosto"
    elsif n_day_of_m == 9
      "Settembre"
    elsif n_day_of_m == 10
      "Ottobbre"
    elsif n_day_of_m == 11
      "Novembre"
    else
      "Dicembre"
    end
  end
end
