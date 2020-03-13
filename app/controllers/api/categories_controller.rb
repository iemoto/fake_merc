class Api::CategoriesController < ApplicationController
  protect_from_forgery
  def index
    @categories = Category.all
    # Category.where("id = ancestry")
  end
end