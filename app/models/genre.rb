class Genre < ApplicationRecord
  has_many :exams, dependent: :destroy
end
