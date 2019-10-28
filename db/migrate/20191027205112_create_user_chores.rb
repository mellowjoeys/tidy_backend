class CreateUserChores < ActiveRecord::Migration[6.0]
  def change
    create_table :user_chores do |t|
      t.integer :chore_id
      t.integer :user_id
      t.date :start_of_week
      t.boolean :completed

      t.timestamps
    end
  end
end
