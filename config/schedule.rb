# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#config setting from: https://github.com/javan/whenever/wiki/RVM-Notes
@current_path = "~/commitwith/current"
job_type :rake, "{ cd #{@current_path} > /dev/null; } && RAILS_ENV=:environment bundle exec rake :task --silent :output"
job_type :script, "{ cd #{@current_path} > /dev/null; } && RAILS_ENV=:environment bundle exec script/:task :output"
job_type :runner, "{ cd #{@current_path} > /dev/null; } && RAILS_ENV=:environment bundle exec rails runner ':task' :output"

every 10.minutes do
  runner "Project.update_info"
end
