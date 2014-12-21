require 'main/controllers/app_controller'

class UsersController < AppController

  def show
  end
  
  def create
    user_id = current_user._id if logged_in?
    article = Article.new(title: page._article._title, subject: page._article._subject, created_at: Time.now, user_id: user_id)
    store._articles << article
    page._article._title=''
    page._article._subject=''
  end
  
  def update
  end
  
  def delete(article)
    store._articles.delete(article)
  end
  
  def user
    find_user params._id
  end
  
  def account
  end
  
  private
  
  def current_user_articles
    store._articles.select{|a| a.user_id == current_user._id}
  end
  
  def owner?(a)
    current_user == find_user(a.user_id)
  end

end
