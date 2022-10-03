class CreateExamManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_managers do |t|
      t.integer :exam_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
