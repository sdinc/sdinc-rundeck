default['sdinc_rundeck']['file_cache_path'] = File.join(Chef::Config['file_cache_path'], 'sdinc_rundeck')

default['sdinc_rundeck']['install_aptitude'] = 'yes'

default['rundeck']['secret_file'] = '/opt/chef/encrypted_data'
