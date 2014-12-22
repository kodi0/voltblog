require 'main/controllers/app_controller'

class UsersController < AppController

  def show
  end

  def account
  end
  # mostly helper method
  # returns user object by id
  def user
    find_user params._id
  end
  # show current_user articles at /account
  def my_articles
    store._articles.find user_id: current_user._id
  end
  
  # Edit article
  # Read the buffer of article
  # and assign it tmp model
  # After editing call save! on model
  def edit_article(article)
    self.model = article.buffer
  end
  # model for new article ?
  # _new_article property for canceling creatiion of article
  # in cancel call we assign _new_article = false
  def new_article
    self.model = store._articles.buffer # creates buffer that assigns to a model which we change latetly
    page._new_article = true            
  end

  # If this is new article ( _new_article is true) then add properties
  # set _new_article to false
  # and save model
  # then clear model with model=nil
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
  # Cancel editing or creating new article
  # assign model nil
  # and new article false
  def cancel
    self.model = nil
    page._new_article = false
  end

end
