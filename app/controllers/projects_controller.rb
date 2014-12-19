class ProjectsController < ApplicationController
  helper_method :projects, :project
  respond_to :json, only: [:index, :create, :update, :destroy]
  respond_to :html, only: [:index]

  def index
    respond_with projects
  end

  def create
    project = Project.create(project_params)
    respond_with project
  end

  def update
    project.update_attributes(project_params)
    respond_with project
  end

  def destroy
    respond_with project.destroy
  end

  private

  def project_params
    params.permit(:title, :description)
  end

  def projects
    @projects ||= Project.all
  end

  def project
    @project ||= Project.find(params[:id])
  end
end
