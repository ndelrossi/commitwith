class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :projects, :skill, :beginner
    rename_column :projects, :title, :name
    rename_column :projects, :category, :categories
  end
end
