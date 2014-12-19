class ProjectsController < ApplicationController
  helper_method :projects, :project

  def projects
    @projects ||= Project.all
  end

  def show
    @project ||= Project.find(params[:id])
  end
end
