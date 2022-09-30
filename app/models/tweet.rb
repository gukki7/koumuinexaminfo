class Tweet < ApplicationRecord
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end
end
