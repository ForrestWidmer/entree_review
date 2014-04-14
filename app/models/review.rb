class Review < ActiveRecord::Base
  belongs_to :entree
  attr_accessible :body, :stars
end
