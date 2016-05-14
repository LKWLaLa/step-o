class CreateStepStyles < ActiveRecord::Migration
  def change
    create_table :step_styles do |t|
      t.integer :step_id
      t.integer :style_id

      t.timestamps null: false
    end
  end
end
