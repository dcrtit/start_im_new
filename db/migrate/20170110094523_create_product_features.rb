class CreateProductFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :product_features do |t|
      t.string :value
      t.references :product, foreign_key: true
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
