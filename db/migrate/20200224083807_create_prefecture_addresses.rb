class CreatePrefectureAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :prefecture_addresses do |t|
      t.integer :prefecture_address_id
      t.string :name

      t.timestamps
    end
  end
end
