class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :stack_id
      t.string :front
      t.string :back

      t.timestamps
    end
    add_index :cards, [:stack_id]
  end
end
