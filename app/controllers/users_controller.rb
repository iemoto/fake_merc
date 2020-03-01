class UsersController < ApplicationController
  def index
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
