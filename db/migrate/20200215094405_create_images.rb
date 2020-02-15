class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :item_id, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
