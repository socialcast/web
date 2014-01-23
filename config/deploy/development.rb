set :stage, :staging
set :rails_env, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{deployer@localhost}
role :web, %w{deployer@localhost}
role :worker, %w{deployer@localhost}
role :db,  %w{deployer@localhost}
role :queue,  %w{deployer@localhost}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a has can be used to set
# extended properties on the server.
server 'localhost', user: 'deployer', roles: %w{web app worker db queue}

set :ssh_options, {
  :port => 2222,
  # :verbose => Logger::DEBUG,
  :password => ENV['SSHPASSWORD']
}
