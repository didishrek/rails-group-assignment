class CreateModulecourses < ActiveRecord::Migration
  def change
    create_table :modulecourses do |t|
      t.string :name
      t.integer :program_id
    end
  end
end
