class AddExamIdToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :exam_id, :integer
  end
end
