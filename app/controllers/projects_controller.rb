class ProjectsController < ApplicationController

  def projects
    @projects ||= Project.all
  end

  def show
    @project ||= Project.find(params[:id])
  end
end
