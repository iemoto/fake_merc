class CardsController < ApplicationController
  add_breadcrumb 'ファイクメルク', :root

  def index
    add_breadcrumb 'マイページ', mypage_path
    add_breadcrumb '支払い方法'
  end

  def new
    add_breadcrumb 'マイページ', mypage_path
    add_breadcrumb '支払い方法'
  end

  def create
  end
end
