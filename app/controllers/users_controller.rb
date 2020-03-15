class UsersController < ApplicationController
  add_breadcrumb 'ファイクメルク', :root

  def index
    add_breadcrumb 'マイページ'
    @user = User.find(current_user.id)
  end

  def show
    add_breadcrumb 'マイページ', mypage_path
    add_breadcrumb 'ログアウト'
    unless user_signed_in? then
      redirect_to root_path
    end
  end

  def edit
    add_breadcrumb 'マイページ', mypage_path
    add_breadcrumb '本人情報の登録'
  end
end
