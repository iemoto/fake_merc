require 'rails_helper'

RSpec.describe SellItem, type: :model do
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
  end
end
