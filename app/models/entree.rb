class Entree < ActiveRecord::Base
  attr_accessible :description, :title, :image, :restaurant

  has_many :reviews
  has_many :images, as: :imageable
  has_many :ratings, dependent: :destroy

  validates :description, :title, :restaurant, presence: true
  validates :title, uniqueness: true

  scope :recent, order("created_at DESC").limit(4)

  include PgSearch
  pg_search_scope :search, against: [[:title, 'A'], :description, :restaurant], 
    using: {tsearch: {dictionary: "english", prefix: true}}

  def self.searching(search_term)
    if search_term.present?
      search(search_term)
    else
      scoped
    end
  end

  def total_ratings
    self.ratings.sum(:value).to_i
  end

end
