class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :despriction
      t.integer :money
      t.boolean :exhibition, default: true, null: false
      t.boolean :during_transaction, default: false, null: false
      t.boolean :soldout, default: false, null: false
      t.integer :prefecture_address_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.integer :item_condition_id, foreign_key: true
      t.integer :shipping_fee_id, foreign_key: true
      t.integer :shipping_method_id, foreign_key: true
      t.integer :ship_date_id, foreign_key: true
      t.references :brand, foreign_key: true
      t.integer :size_id, foreign_key: true
      t.timestamps
    end
  end
end
