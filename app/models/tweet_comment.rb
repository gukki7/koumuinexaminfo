class TweetComment < ApplicationRecord
  belongs_to :customer
  belongs_to :tweet
end
