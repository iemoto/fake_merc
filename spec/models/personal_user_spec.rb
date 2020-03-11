require 'rails_helper'

RSpec.describe PersonalUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '新規会員登録、カナ、生年月日' do
    it 'first_name,last_namenick_name,first_name_kana,last_name_kana,birth_year,birth_month,birth_dayが全部ある場合、登録できる' do
      personal_user = build(:personal_user)
      expect(personal_user).to be_valid
    end

    it 'first_nameがない場合、登録できない' do
      personal_user = build(:personal_user, first_name: nil)
      personal_user.valid?
      expect(personal_user.errors[:first_name]).to include("can't be blank")
    end

    it 'last_nameがない場合、登録できない' do
      personal_user = build(:personal_user, last_name: nil)
      personal_user.valid?
      expect(personal_user.errors[:last_name]).to include("can't be blank")
    end

    it 'first_name_kanaがない場合、登録できない' do
      personal_user = build(:personal_user, first_name_kana: nil)
      personal_user.valid?
      expect(personal_user.errors[:first_name_kana]).to include("can't be blank")
    end

    it 'last_name_kanaがない場合、登録できない' do
      personal_user = build(:personal_user, last_name_kana: nil)
      personal_user.valid?
      expect(personal_user.errors[:last_name_kana]).to include("can't be blank")
    end

    it 'birth_yearがない場合、登録できない' do
      personal_user = build(:personal_user, birth_year: nil)
      personal_user.valid?
      expect(personal_user.errors[:birth_year]).to include("can't be blank")
    end

    it 'birth_monthがない場合、登録できない' do
      personal_user = build(:personal_user, birth_month: nil)
      personal_user.valid?
      expect(personal_user.errors[:birth_month]).to include("can't be blank")
    end

    it 'birth_dayがない場合、登録できない' do
      personal_user = build(:personal_user, birth_day: nil)
      personal_user.valid?
      expect(personal_user.errors[:birth_day]).to include("can't be blank")
    end

  end
end
