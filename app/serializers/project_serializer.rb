class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :author, :categories, :beginner, :description,
             :languages, :size, :open_issues, :last_update, :needs, :active
end
