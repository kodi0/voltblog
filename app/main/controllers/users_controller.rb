require 'main/controllers/app_controller'

class UsersController < AppController

  def show
  end

  def user
    find_user params._id
  end

end
