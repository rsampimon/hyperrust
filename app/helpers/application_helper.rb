module ApplicationHelper

  def nav_items(navs)
    all_contents = ''
    navs.each do |nav|
     if nav.active
        contents = ''
        contents << content_tag(:a, nav.name.html_safe, :href => public_page_url(nav.slug))
        # contents << "&nbsp;"
        contents << content_tag(:ul, nav_items(nav.children).html_safe) if nav.children.any?
        all_contents << content_tag(:li, contents.html_safe, :id => "page_#{nav.id}")
      end
    end
    all_contents
  end

  def admin_nav_items(navs)
    all_contents = ''
    navs.each do |nav|
      contents = ''
      contents << content_tag(:span, "grip", :class => "grip")
      contents << content_tag(:a, nav.name.html_safe, :href => edit_page_url(nav), :class => ("inactive" if !nav.active))
      contents << "&nbsp;"
      contents << content_tag(:ul, admin_nav_items(nav.children).html_safe) if nav.children.any?
      all_contents << content_tag(:li, contents.html_safe, :id => "page_#{nav.id}")
    end
    all_contents
  end

end
