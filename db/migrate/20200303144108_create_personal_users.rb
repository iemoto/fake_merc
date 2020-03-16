class CreatePersonalUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_users do |t|
      t.bigint     :user_id, foreign_key: true
      t.string     :first_name, null: false
      t.string     :last_name, null: false
      t.string     :first_name_kana, null: false
      t.string     :last_name_kana, null: false
      t.integer    :birth_year, null: false
      t.integer    :birth_month, null: false
      t.integer    :birth_day, null: false
      t.integer    :post_number
      t.bigint     :prefecture_address_id, foreign_key: true
      t.string     :municipality_address
      t.string     :street_address
      t.string     :building_name_adress

      t.timestamps
    end
  end
end
