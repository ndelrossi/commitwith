class ProjectMailer < ActionMailer::Base
  default from: "commitwith@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.project_control.subject
  #
  def project_control(project)
    @project = project
    mail :to => project.email, :subject => "Project Activation and Control"
  end
end
