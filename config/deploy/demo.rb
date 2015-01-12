role :app, %w{ubuntu@54.174.166.127}
role :web, %w{ubuntu@54.174.166.127}
role :db,  %w{ubuntu@54.174.166.127}

server '54.174.166.127', user: 'ubuntu', roles: %w{web app}

set :branch, :master
set :deploy_to, '/home/ubuntu/demo/cg_feedback_collection'
set :rails_env, 'demo'