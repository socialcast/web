set :application, 'squash'
set :repo_url, 'git@github.com:socialcast/web.git'

set :deploy_to, '/var/www/squash'
set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{
  config/database.yml
  config/environments/common/authentication.yml
  config/environments/common/mailer.yml
  config/environments/common/jira.yml
  config/environments/common/jiracert.pem
  config/environments/common/jirakey.pem
  config/environments/production/dogfood.yml
  config/environments/production/javascript_dogfood.yml
  config/environments/production/mailer.yml
  config/initializers/secret_token.rb
}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      unicorn_pid = capture("cat #{File.join(shared_path, 'tmp', 'pids', 'unicorn.pid')}")
      if test "ps -p #{unicorn_pid} > /dev/null"
        execute :kill, "-s USR2 #{unicorn_pid}"
      else
        execute :unicorn_rails, "--config-file /etc/unicorn.rb --env production --daemonize"
      end
    end
    on roles(:worker), in: :sequence, wait: 5 do
      resque_pool_pid = capture("cat #{File.join(shared_path, 'tmp', 'pids', 'resque-pool.pid')}")
      if test "ps -p #{resque_pool_pid} > /dev/null"
        execute :kill, "-s QUIT #{resque_pool_pid}"
      end
    end
  end

  after :finishing, 'deploy:cleanup'

end
