class PersonalUser < ApplicationRecord
  # associations
  belongs_to :user, optional: true
  #全角ひらがな、漢字
  VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  #全角カタカナ
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :last_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
end
