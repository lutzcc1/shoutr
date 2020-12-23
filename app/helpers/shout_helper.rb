module ShoutHelper

  def shout_form_for(content_type)
    form_for(Shout.new, url: content_type.new) do |f|
      f.fields_for(:content) { |content_form| yield(content_form) } +
      f.submit("Shout!")
    end
  end

  def like_button(shout)
    if current_user.liked? shout
      link_to "unlike", unlike_shout_path(shout), method: :delete
    else
      link_to "like", like_shout_path(shout), method: :post
    end
  end

  def autolink(text)
    text.gsub(/@\w+/) { |mention| link_to mention, user_path(mention[1..-1])}.html_safe
  end
end
