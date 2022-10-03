class Subject < ApplicationRecord
  has_many :exam_managers, dependent: :destroy
  has_many :exams, through: :exam_managers
end
