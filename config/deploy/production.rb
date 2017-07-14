server '13.114.63.26', user: 'app', roles: %w{app db web}
set :ssh_options, keys: 'User/nakamurayuuya/.ssh/id_rsa'
