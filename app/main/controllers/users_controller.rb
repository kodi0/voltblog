require 'main/controllers/app_controller'

class UsersController < AppController

  def show
  end

  def account
  end

  def user
    find_user params._id
  end

  def my_articles
    store._articles.find user_id: current_user._id
  end

  def edit_article(article)
    self.model = article.buffer
  end

  def new_article
    self.model = store._articles.buffer
    page._new_article = true
  end

  def save!
    if page._new_article
      self.model._created_at = Time.now
      self.model._user_id = current_user._id
      page._new_article = false
    end

    self.model.save!
    self.model = nil
  end

  def delete_article(article)
    store._articles.delete article
  end

  def cancel
    self.model = nil
    page._new_article = false
  end

end
