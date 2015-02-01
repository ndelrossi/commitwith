class AddLastUpdateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :last_update, :string
  end
end
