class Entree < ActiveRecord::Base
  has_many :reviews
  has_many :images, as: :imageable
  attr_accessible :description, :title, :image

end
