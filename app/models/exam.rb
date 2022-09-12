class Exam < ApplicationRecord
  has_many :subjects, dependent: :destroy
  belongs_to :genre
end
