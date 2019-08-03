class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :category
      t.text :description
      t.integer :rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
