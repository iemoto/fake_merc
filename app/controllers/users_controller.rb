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
    @personal = PersonalUser.find_by(user_id: current_user.id)
  end

  def update
    @personal = PersonalUser.find_by(user_id: current_user.id)
    @personal.update(address_params)
    if @personal.save
     redirect_back(fallback_location: root_url)
     flash[:notice] = '住所情報を更新しました'
    else
     redirect_back(fallback_location: root_url)
     flash[:notice] = '住所情報の更新に失敗しました'
    end
  end

  private
  def address_params
    params.require(:personal_user).permit(:post_number, :street_address, :prefecture_address_id, :municipality_address, :building_name_adress, :building_name_address)
  end
end
