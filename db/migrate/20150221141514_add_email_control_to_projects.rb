class AddEmailControlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :email, :string
    add_column :projects, :auth_token, :string
    add_column :projects, :active, :boolean, default: false
  end
end
