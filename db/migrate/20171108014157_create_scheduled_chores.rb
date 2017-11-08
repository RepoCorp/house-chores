class CreateScheduledChores < ActiveRecord::Migration[5.0]
  def change
    create_table :scheduled_chores do |t|
      t.integer :chore_id
      t.integer :user_id
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday

      t.timestamps
    end
  end
end
