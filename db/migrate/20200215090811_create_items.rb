class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :despriction
      t.integer :money
      t.boolean :sold_out
      # t.references :prefecture_address_id, foreign_key: true
      # t.references :categorie_id, foreign_key: true
      # t.references :item_condition_id, foreign_key: true
      # t.references :shippong_fee_id, foreign_key: true
      # t.references :shipping_fee_side, foreign_key: true
      # t.references :shipping_method_id, foreign_key: true
      # t.references :ship_date_id, foreign_key: true
      # t.references :brand_id, foreign_key: true
      # t.references :size_id, foreign_key: true

      t.timestamps
    end
  end
end
