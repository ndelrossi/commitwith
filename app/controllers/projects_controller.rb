class ProjectsController < ApplicationController
  helper_method :projects, :project
  respond_to :json, only: [:index, :create, :update, :destroy]
  respond_to :html, only: [:index, :show]

  def index
    respond_with projects
  end

  def show
    @project = Project.find_by_activation_token!(params[:id])
    if @project.update_attribute(:active, true)
      render :show
    else
      redirect_to root_url
    end
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
    params.permit(:name, :email, :author, :description, :needs, :languages, :size, :open_issues, :categories, :beginner, :last_update)
  end

  def projects
    @projects ||= Project.all
  end

  def project
    @project ||= Project.find(params[:id])
  end
end
