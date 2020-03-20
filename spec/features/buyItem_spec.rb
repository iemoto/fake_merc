require 'rails_helper'

RSpec.feature '商品購入機能' do
  before do
    visit '/signup/registration'
    fill_in 'nick_name', with: 'ジョン'
    fill_in 'email', with: 'test@user.com'
    fill_in 'password', with: "hogehoge"
    fill_in 'first_name', with: '山田'
    fill_in 'last_name', with: '太郎'
    fill_in 'first_name_kana', with: 'ヤマダ'
    fill_in 'last_name_kana', with: 'タロウ'
    select '1995', from: 'birth_year'
    select '4', from: 'birth_month'
    select '29', from: 'birth_day'
    click_button '次に進む'
  end

  scenario 'ログアウトできているか？' do
    visit '/logout'
    click_link ('logout-btn')
    expect(page).to have_content('ログイン')
    expect(page).not_to have_content('ログアウト')
  end
end
