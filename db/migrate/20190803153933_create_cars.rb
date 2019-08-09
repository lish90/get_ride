class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make,  null: false
      t.string :model,  null: false
      t.string :category,  null: false
      t.text :description,  null: false
      t.integer :rate,  null: false, default:  0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
