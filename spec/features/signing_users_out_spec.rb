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
  describe 'login via Facebook' do
    let(:user) { User.create(name: 'hoge', email: 'hoge@hoge.com') }
  
    before do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock(
        email: user.email,
        name: user.name 
      )
      click_link 'Facebookを利用してログインする'
    end
  
  
    it 'should succeed' do
      expect(page.status_code).to eq 200
    end
      OmniAuth.config.test_mode = true
  
  end
end