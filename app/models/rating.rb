class Rating < ActiveRecord::Base
  belongs_to :entree
  attr_accessible :value, :entree

  validates :value, inclusion: { in: [1, 2, 3, 4, 5], message: "%{value} is not a valid rating." }
end
