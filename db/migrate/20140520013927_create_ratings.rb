class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :entree

      t.timestamps
    end
    add_index :ratings, :entree_id
  end
end
