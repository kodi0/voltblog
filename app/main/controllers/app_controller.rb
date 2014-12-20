class AppController < Volt::ModelController

  def logged_in?
    !current_user.nil?
  end

  def current_user
    Volt.user
  end

  def find_user(id)
    store._users.find_one _id: id
  end

end
