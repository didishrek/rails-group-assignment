class CreateModuleadmins < ActiveRecord::Migration
  def change
    create_table :moduleadmins do |t|
    t.integer :user_id
    t.integer :module_course_id
    end
  end
end
