class Api::CategoriesController < ApplicationController
  protect_from_forgery
  def index
    @categories = Category.all
  end
end