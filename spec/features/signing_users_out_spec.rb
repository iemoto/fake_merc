require 'rails_helper'

RSpec.feature 'Signing out signed-in users' do
  before do
    @user = FactoryBot.create(:user)

    visit '/users/sign_in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  scenario '　ログアウトできているか？' do
    visit '/logout'
    click_link ('logout-btn')
    expect(page).to have_content('ログイン')
    expect(page).not_to have_content('ログアウト')
  end
end
