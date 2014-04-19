class Review < ActiveRecord::Base
  belongs_to :entree
  has_many :images, as: :imageable
  attr_accessible :body, :stars
end
