class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
    t.integer :user_id
    t.integer :module_course_id
    t.integer :grade
    end
  end
end
