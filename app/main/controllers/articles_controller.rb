require 'main/controllers/app_controller'

class ArticlesController < AppController

  def index
  end

  def show
    store._articles.find_one(_id: params._id)
  end

  def update
  end

  def create
    user_id = current_user._id if logged_in?
    article = Article.new(title: page._article._title, subject: page._article._subject, created_at: Time.now, user_id: user_id)
    store._articles << article
    page._article._title=''
    page._article._subject=''
  end

  def delete(article)
    store._articles.delete(article)
  end

  private

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end

end