class CreateTimemarkers < ActiveRecord::Migration
  def change
    create_table :timemarkers do |t|
      t.string :marker
      t.integer :video_id
      t.integer :step_id

      t.timestamps null: false
    end
  end
end

