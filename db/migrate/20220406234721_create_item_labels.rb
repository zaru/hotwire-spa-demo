class CreateItemLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :item_labels do |t|
      t.references :item
      t.references :label
      t.timestamps
    end
  end
end
