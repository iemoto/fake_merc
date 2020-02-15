require 'rails_helper'

RSpec.feature 'Signing out signed-in users' do

  before do
    @user = FactoryBot.create(:user)

    visit '/users/sign_in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  scenario 'ログアウトできているか？' do
    visit '/logout'
    click_link ('logout-btn')
    expect(page).to have_content('ログイン')
    expect(page).not_to have_content('ログアウト')
  end
<<<<<<< HEAD
=======
  
  describe 'Facebookのアカウント情報を取得し、すでにDBに登録されていればログインさせる' do
    let(:user) { User.create(nick_name: 'kou', email: 'kou@kou') }
    before do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock(
        email: user.email,
        nick_name: user.nick_name 
      )
      click_on 'Facebook_login'
    end
  
  
    it 'should succeed' do
      expect(page.status_code).to eq 200
    end
  end
>>>>>>> remotes/origin/userlogin
end