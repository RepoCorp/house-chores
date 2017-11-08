class CreateExecutedChores < ActiveRecord::Migration[5.0]
  def change
    create_table :executed_chores do |t|
      t.integer :chore_id
      t.integer :user_id

      t.timestamps
    end
  end
end
