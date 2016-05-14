class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.integer :level_of_mastery
      t.string :notes
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
