class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :description
      t.string :color

      t.timestamps
    end
  end
end
