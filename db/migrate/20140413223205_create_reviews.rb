class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :body
      t.references :entree

      t.timestamps
    end
    add_index :reviews, :entree_id
  end
end
