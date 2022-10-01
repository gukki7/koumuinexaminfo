class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :tweets, through: :tagmaps
end
