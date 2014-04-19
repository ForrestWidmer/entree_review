class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.integer :imageable_id #could also have used 'belongs_to :imageable, polymorphic: true'
      t.string :imageable_type

      t.timestamps
    end
    add_index :images, [:imageable_id, :imageable_type]
  end
end
