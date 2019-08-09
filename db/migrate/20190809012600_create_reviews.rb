class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :title,  null: false
      t.text :details,  null: false
      t.integer :rating, null: false, default:  0
      t.date :review_date, null: false
      t.references :user, foreign_key: true
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
