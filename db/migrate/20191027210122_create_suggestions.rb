class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.integer :chore_id
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
  end
end
