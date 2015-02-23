class ProjectsController < ApplicationController
  helper_method :projects, :project
  respond_to :json, only: [:index, :create, :update, :destroy]
  respond_to :html, only: [:index]

  def index
    respond_with projects
  end

  def activate
    if @project = Project.find_by_auth_token(params[:id])
      @project.update_attribute(:active, true)
      @alert = "new"
    else
      @alert = "not_found"
    end
    redirect_to action: 'index', alert: @alert
  end

  def create
    project = Project.create(project_params)
    project.send_activation if project
    respond_with project
  end

  def update
    project.update_attributes(project_params)
    respond_with project
  end

  def destroy
    if @project = Project.find_by_auth_token(params[:id])
      @project.destroy
    end
    redirect_to root_url
  end

  private

  def project_params
    params.permit(:name, :email, :author, :description, :needs, :languages, :size, :open_issues, :categories, :beginner, :last_update)
  end

  def projects
    @projects ||= Project.active
  end

  def project
    @project ||= Project.find(params[:id])
  end
end
