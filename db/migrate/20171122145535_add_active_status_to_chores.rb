class AddActiveStatusToChores < ActiveRecord::Migration[5.0]
  def change
    add_column :scheduled_chores, :active, :boolean
    add_column :executed_chores, :completed, :boolean, default: false
  end
end
