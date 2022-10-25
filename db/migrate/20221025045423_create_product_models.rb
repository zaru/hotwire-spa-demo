class CreateProductModels < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
    end
    create_table :product_models do |t|
      t.references :product, index: true
      t.string :model_number

      t.timestamps
    end
  end
end
