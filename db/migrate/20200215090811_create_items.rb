class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :money
      t.boolean :exhibition, default: true
      t.boolean :during_transaction, default: false
      t.boolean :soldout, default: false
      t.integer :prefecture_address_id, foreign_key: true, default: nil
      t.integer :category_id, foreign_key: true, default: nil
      t.integer :item_condition_id, foreign_key: true, default: nil
      t.integer :shipping_fee_id, foreign_key: true, default: nil
      t.integer :shipping_method_id, foreign_key: true, default: nil
      t.integer :ship_date_id, foreign_key: true, default: nil
      t.references :brand, foreign_key: true
      t.integer :size_id, foreign_key: true, default: nil
      t.timestamps
    end
  end
end
