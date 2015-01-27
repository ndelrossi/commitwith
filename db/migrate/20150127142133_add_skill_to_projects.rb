class AddSkillToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :skill, :string
  end
end
