class CreateProgramadmins < ActiveRecord::Migration
  def change
    create_table :programadmins do |t|
    t.integer :user_id
    end
  end
end
