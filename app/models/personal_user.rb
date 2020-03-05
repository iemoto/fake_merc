class PersonalUser < ApplicationRecord
  # associations
  belongs_to :user, optional: true

  validates :first_name, presence: true;
            :last_name, presence: true;
            :first_name_kana, presence: true;
            :last_name_kana, presence: true;
            :birth_year, presence: true;
            :birth_month, presence: true;
            :birth_date, presence: true;

end
