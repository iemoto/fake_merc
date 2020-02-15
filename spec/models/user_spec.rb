require 'rails_helper'

RSpec.describe User, type: :model do
    describe '新規会員登録' do
    it 'nick_name,email,passwordが全部ある場合、登録できる' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'nick_nameがない場合、登録できない' do
      user = build(:user, nick_name: nil)
      user.valid?
      expect(user.errors[:nick_name]).to include("can't be blank")
    end

    it 'emailがない場合、登録できない' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'passwordがない場合、登録できない' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'passwordが7文字以上の場合、登録できる' do
      user = build(:user, password: 'aaaaaaa', password_confirmation: 'aaaaaaa')
      user.valid?
      expect(user).to be_valid
    end

    it 'passwordが6文字以下の場合、登録できない' do
      user = build(:user, password: 'aaaaaa', password_confirmation: 'aaaaaa')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 7 characters)')
    end

    it '重複したemailが存在する場合、登録できない' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    discribe 'Facebookのアカウント情報を取得し、すでにDBに登録されていればログインさせる' do
      let(:user) { User.create(nick_name: 'kou', email: 'kou@kou') }
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
    end
  end
end
