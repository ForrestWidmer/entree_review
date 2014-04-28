class Entree < ActiveRecord::Base
  has_many :reviews
  has_many :images, as: :imageable
  attr_accessible :description, :title, :image, :restaurant

  def self.searching(params)
    search(params[:search])
  end

  scope :recent, order("created_at DESC").limit(4)

end
