class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url, :default => ""
      t.decimal :price, precision: 8, scale: 2
      t.string :prod_type

      t.timestamps
    end
  end
end
