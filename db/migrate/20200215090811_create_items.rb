class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :despriction
      t.integer :money
      t.boolean :sold_out
      t.references :prefecture_address, foreign_key: true
      t.references :categorie, foreign_key: true
      t.references :item_condition, foreign_key: true
      t.references :shippong_fee, foreign_key: true
      t.references :shipping_fee_side, foreign_key: true
      t.references :shipping_method, foreign_key: true
      t.references :ship_date, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :size, foreign_key: true

      t.timestamps
    end
  end
end
