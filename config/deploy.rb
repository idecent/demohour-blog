default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :application, "ipromise"

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:idecent/demohour-blog.git"  # Your clone URL
set :branch, "master"
set :scm, "git"
set :user, "deployer"  # The server's user for deploys
set :deploy_to, "/srv/blog"
set :deploy_via, :remote_cache
default_environment['PATH']='$PATH:$HOME/bin:/usr/local/git/bin:/usr/local/ruby/bin'
set :use_sudo, false

ssh_options[:forward_agent] = true

set :git_shallow_clone, 1
set :git_enable_submodules, 1

role :web, "58.68.234.29"                          # Your HTTP server, Apache/etc
role :app, "58.68.234.29"                          # This may be the same as your `Web` server
role :db,  "58.68.234.29", :primary => true # This is where Rails migrations will run
ssh_options[:port] = 22222

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Compile assets"
  task :assets do
    run "cd #{current_path}; RAILS_ENV=production rake assets:precompile"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
    run "mkdir -p #{current_path}/tmp/cache"
    run "cd #{current_path}; sudo chmod -R 0777 log/"
    run "cd #{current_path}; sudo chmod -R 0777 tmp/"
    run "cd #{current_path}; sudo chmod -R 0777 public/"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/system/ #{release_path}/public/"
  end
end

# namespace :db do
#   desc "migrate db"
#   task :migrate, :roles => :app do
#     run "cd #{release_path} && RAILS_ENV=production rake db:migrate"
#   end
# end
# 
# after 'deploy:update_code', 'db:migrate'

after 'deploy:update_code', 'deploy:symlink_shared'
#after "deploy:symlink_shared", "deploy:assets"