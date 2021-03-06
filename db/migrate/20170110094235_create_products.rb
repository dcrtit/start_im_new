class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.float :action_price
      t.text :description
      t.boolean :hit
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
