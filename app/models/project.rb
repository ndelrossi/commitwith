class Project < ActiveRecord::Base

  def self.update_info
    Project.order('updated_at ASC').limit(2).each do |project|
      response = HTTParty.get("https://api.github.com/repos/#{project.author}/#{project.title}")
      project.update_attributes(size:        response["size"],
                                open_issues: response["open_issues_count"],
                                last_update: response["updated_at"])
    end
  end
end
