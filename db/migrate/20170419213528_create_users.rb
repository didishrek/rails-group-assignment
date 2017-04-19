class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type_user
      t.string :name
      t.string :email
      t.string :password_digest

    end
  end
end
