class CreateMasks < ActiveRecord::Migration[5.2]
  def change
    create_table :masks do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
