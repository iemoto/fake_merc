require 'rails_helper'

RSpec.describe PersonalUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  describe '新規会員登録、カナ、生年月日' do
    it 'first_name,last_namenick_name,first_name_kana,last_name_kana,birth_year,birth_month,birth_dayが全部ある場合、登録できる' do
      personal_user = build(:personal_user)
      expect(personal_user).to be_valid
    end


    it 'nick_nameがない場合、登録できない' do
      personal_user = build(:personal_user, first_name: nil)
      personal_user.valid?
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
  end

end
