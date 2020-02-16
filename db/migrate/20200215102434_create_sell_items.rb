class CreateSellItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_items do |t|
      # t.references :user_id, foreign_key: true
      # t.references :item_id, foreign_key: true
      t.boolean :delibery_for
      t.boolean :arrival_to
      t.integer :commition_fee

      t.timestamps
    end
  end
end
