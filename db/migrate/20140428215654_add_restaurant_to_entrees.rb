class AddRestaurantToEntrees < ActiveRecord::Migration
  def change
    add_column :entrees, :restaurant, :string
  end
end
