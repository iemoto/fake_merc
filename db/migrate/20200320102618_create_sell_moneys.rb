class CreateSellMoneys < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_moneys do |t|
      t.references :user, foreign_key: true, null: false
      t.references :sell_item, foreign_key: true, null: false
      t.integer :sell_money, null: false

      t.timestamps
    end
  end
end
