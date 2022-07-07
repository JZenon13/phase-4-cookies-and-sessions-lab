class Article < ApplicationRecord
  belongs_to :user

  def author
    user.username
  end

  def preview
    content.split("\n")[1]
  end

  def date
    created_at.strftime('%B %e, %Y')
  end

  def page_views
    cookies[:page_views] ||= 0
    cookies[:page_views] = cookies[:page_views].to_i + 1
    session[:page_views] ||= 0
    session[:page_views] += 1
  end

end
