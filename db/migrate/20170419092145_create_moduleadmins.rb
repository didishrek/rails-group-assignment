class CreateModuleadmins < ActiveRecord::Migration
  def change
    create_table :moduleadmins do |t|
    t.integer :user_id
    end
  end
end
