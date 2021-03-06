default_environment['RDIO_KEY']    = ENV['RDIO_KEY']
default_environment['RDIO_SECRET'] = ENV['RDIO_SECRET']

require "bundler/capistrano"
set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

set :application, "sink"
set :repository,  "git@github.com:royvandewater/sink"

set :user, 'deploy'
set :deploy_to, '/home/deploy/apps/sink'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "sink.royvandewater.com"                          # Your HTTP server, Apache/etc
role :app, "sink.royvandewater.com"                          # This may be the same as your `Web` server
role :db,  "sink.royvandewater.com", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy", "deploy:migrate"
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
