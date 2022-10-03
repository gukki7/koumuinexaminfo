class Exam < ApplicationRecord
  has_many :exam_managers, dependent: :destroy
  has_many :subjects, through: :exam_managers
  belongs_to :genre
end
