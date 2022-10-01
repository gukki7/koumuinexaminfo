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


  def tag_name_list
    tags.pluck(:tag_name).join(" ")
  end

  def save_tweets(tag_name_list)
    tagmaps.destroy_all

    tag_name_list.each do |tag_name|
      tags << Tag.find_or_create_by(tag_name: tag_name)
    end
  end
end
