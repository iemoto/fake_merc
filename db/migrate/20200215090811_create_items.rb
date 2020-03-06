class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :despriction
      t.integer :money
      t.boolean :exhibition, default: true, null: false
      t.boolean :during_transaction, default: false, null: false
      t.boolean :soldout, default: false, null: false
      t.timestamps
    end
  end
end
