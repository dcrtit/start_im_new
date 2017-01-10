class AddNestedToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :parent_id, :integer
    add_column :categories, :lft, :integer
    add_column :categories, :rgt, :integer
    add_column :categories, :depth, :integer
    add_column :categories, :children_count, :integer
  end
end
