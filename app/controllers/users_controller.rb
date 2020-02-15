class UsersController < ApplicationController
  def index_login
  end

  def show
    unless user_signed_in? then
      redirect_to root_path
    end
  end
end
