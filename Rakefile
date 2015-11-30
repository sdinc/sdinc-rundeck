# encoding: utf-8

def run_command(command)
  if File.exist?('Gemfile.lock')
    sh %(bundle exec #{command})
  else
    sh %(chef exec #{command})
  end
end

desc 'kitchen converge'
task :run do
  run_command('kitchen converge')
end

desc 'kitchen destroy'
task :stop do
  run_command('kitchen destroy')
end

namespace :berks do
  desc 'vendor the cookbooks'
  task :vendor do
    run_command('rm -rvf berks-cookbooks Berksfile.lock')
    run_command('berks vendor')
  end
end

namespace :gen do
  desc 'generate ssh key for rundeck nodes'
  task :sshkey do
    run_command('rm -rvf test/integration/server/rundeck_rsa')
    run_command('rm -rvf test/integration/server/rundeck_rsa.pub')
    run_command("ssh-keygen -N '' -q -f test/integration/server/rundeck_rsa")
    run_command("cat test/integration/server/rundeck_rsa | awk '{ printf \"%s\\n\", $0 }'")
    run_command("cat test/integration/server/rundeck_rsa.pub | awk '{ printf \"%s\\n\", $0 }'")
  end
  desc 'generate secret'
  task :secret do
    run_command("openssl rand -base64 512 | tr -d '\r\n' > test/integration/server/encrypted_data_bag_secret")
  end
  desc 'generate encrypted data bag from secret'
  task :data_bag do
    run_command('knife data bag create rundeck info --secret-file test/integration/server/encrypted_data_bag_secret')
  end
end

namespace :ci do
  desc 'run the unit tests'
  task :unit do
    run_command('rubocop')
    run_command('foodcritic . ')
    # run_command('rspec --format RspecJunitFormatter  --out rspec.xml')
    run_command('rspec ')
  end
  desc 'run the integration tests'
  task :integration do
    run_command('kitchen test')
  end
end

# The default rake task should just pull all cookbooks cleanly
task default: ['berks:vendor']
