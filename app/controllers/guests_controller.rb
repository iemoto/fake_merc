class GuestsController < ApplicationController
  def create
    user = User.find_or_create_by!(nick_name: 'testUser') do |user|
      user.nick_name = SecureRandom.base58(10)
      user.password = SecureRandom.base58(20)
      user.email = "testUser@#{user.nick_name}"
    end
    personal = PersonalUser.find_or_create_by!(first_name: 'testUser') do |personal|
      personal.user_id = user.id
      personal.first_name = '名無之'
      personal.last_name = '権平'
      personal.first_name_kana = 'ナナシノ'
      personal.last_name_kana = 'ゴンベイ'
      personal.birth_year = '1995'
      personal.birth_month = '4'
      personal.birth_day = '29'
    end
    sign_in user
    redirect_to root_url
    flash[:notice] = 'ゲストログインしました'
  end
end