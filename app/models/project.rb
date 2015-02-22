class Project < ActiveRecord::Base

  before_create { generate_token(:auth_token) }

  def send_activation
    ProjectMailer.project_control(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Project.exists?(column => self[column])
  end

  def self.update_info
    Project.order('updated_at ASC').limit(2).each do |project|
      response = HTTParty.get("https://api.github.com/repos/#{project.author}/#{project.name}")
      project.update_attributes(size:        response["size"],
                                open_issues: response["open_issues_count"],
                                last_update: response["updated_at"])
      project.touch
    end
  end
end
