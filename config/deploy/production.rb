set :stage, :production
set :rails_env, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{deploy@squash.app.socialcast.com}
role :web, %w{deploy@squash.app.socialcast.com}
role :db,  %w{deploy@squash.app.socialcast.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a has can be used to set
# extended properties on the server.
server 'squash.app.socialcast.com', user: 'deploy', roles: %w{web app db}
