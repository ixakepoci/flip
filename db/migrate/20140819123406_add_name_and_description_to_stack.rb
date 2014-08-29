class AddNameAndDescriptionToStack < ActiveRecord::Migration
  def change
    add_column :stacks, :name, :string
    add_column :stacks, :description, :string
  end
end
