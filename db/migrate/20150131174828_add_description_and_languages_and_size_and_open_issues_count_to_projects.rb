class AddDescriptionAndLanguagesAndSizeAndOpenIssuesCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description, :text
    add_column :projects, :languages,   :string
    add_column :projects, :size,        :integer
    add_column :projects, :open_issues, :integer
  end
end
