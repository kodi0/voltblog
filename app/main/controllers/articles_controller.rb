class ArticlesController < Volt::ModelController
  def index
    # Add code for when the index view is loaded
  end

  def show
    # Add code for when the about view is loaded
    store._articles.find_one(_id: params._id)
  end

  def update
  end

  def create
    article = Article.new(title: page._article._title, subject: page._article._subject, user: "Roman")
    store._articles << article
    page._article._title=''
    page._article._subject=''
  end

  def delete article
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