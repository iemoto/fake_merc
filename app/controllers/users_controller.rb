class UsersController < ApplicationController
  def index
  end

  def show
    unless user_signed_in? then
      redirect_to root_path
    end
  end

  def edit
  end


end
