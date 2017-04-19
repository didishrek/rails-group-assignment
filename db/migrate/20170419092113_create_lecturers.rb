class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
    t.integer :user_id
    t.integer :module_course_id_1
    t.integer :module_course_id_2
    t.integer :module_course_id_3
    end
  end
end
