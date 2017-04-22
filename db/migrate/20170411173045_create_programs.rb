class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.timestamp :inscription_limit
      t.timestamp :deadline_grade
    end
  end
end
