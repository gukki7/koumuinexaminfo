class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :tweet
  validates :customer_id, uniqueness: { scope: :tweet }
end
