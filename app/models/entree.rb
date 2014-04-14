class Entree < ActiveRecord::Base
  has_many :reviews
  attr_accessible :description, :title
end
