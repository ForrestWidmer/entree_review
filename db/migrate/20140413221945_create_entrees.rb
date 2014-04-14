class CreateEntrees < ActiveRecord::Migration
  def change
    create_table :entrees do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
