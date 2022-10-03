class ExamManager < ApplicationRecord
  belongs_to :subject
  belongs_to :exam
end
