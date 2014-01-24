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
  after :publishing, :restart

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, File.join(release_path, 'tmp', 'restart.txt')
    end
    on roles(:worker), in: :sequence, wait: 5 do
      resque_pool_pid_file = File.join(shared_path, 'tmp', 'pids', 'resque-pool.pid')
      if test("ls #{resque_pool_pid_file}")
        resque_pool_pid = capture("cat #{resque_pool_pid_file}")
        if test "ps -p #{resque_pool_pid} > /dev/null"
          sudo :kill, "-s QUIT #{resque_pool_pid}"
        end
      else
        sudo "/etc/init.d/squash_resque", "start"
      end
    end
  end

  after :finishing, 'deploy:cleanup'

end
