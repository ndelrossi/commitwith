class AddNeedsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :needs, :text
  end
end
