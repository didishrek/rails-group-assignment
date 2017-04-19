class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students, :id => false do |t|
      t.primary_key :student_number
      t.integer :user_id
      t.integer :module_course_id_1
      t.integer :module_course_id_2
      t.integer :module_course_id_3
      t.integer :module_course_id_4
      t.integer :module_course_id_5
    end
  end
end
