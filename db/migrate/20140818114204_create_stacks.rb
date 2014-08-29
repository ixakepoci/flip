class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :stacks, [:user_id]
  end
end

