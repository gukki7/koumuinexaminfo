class ChangeDatatypeLevelOfExams < ActiveRecord::Migration[6.1]
  def change
    change_column :exams, :level, :float
  end
end
