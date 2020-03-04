class UsersController < ApplicationController
  add_breadcrumb 'Home', 'http://www.example.com'

  def index
    add_breadcrumb 'マイページ'
    @user = User.find(current_user.id)
  end

  def show
    unless user_signed_in? then
      redirect_to root_path
    end
  end

  def edit
  end
end
