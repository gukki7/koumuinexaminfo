class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
    t.string :name, null: false
    t.string :level, null: false
    t.text :introduction, null: false
    t.integer :genre_id, null: false
      t.timestamps
    end
  end
end
