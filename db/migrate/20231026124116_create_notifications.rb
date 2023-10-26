class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id, null: false
      t.integer :visited_id, null: false
      t.integer :action_id, null: false
      t.integer :action, default: 0, null: false
      t.boolean :is_checked, default: false, null: false
      t.timestamps
    end
  end
end
