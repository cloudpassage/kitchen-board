require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :console do
  require "halo_api_console/version"
  require 'awesome_print'
  require 'halo_api_console/cp_config.rb'
  require 'halo_api_console/cp_response.rb'
  require 'halo_api_console/cp_session.rb'
  require 'halo_api_console/cp_irb.rb'

  puts "CloudPassage API Ruby Command Line Interface"
  puts "********************************************"
  puts
  cp = CpSession.new()
  puts " Now you can call: cp.get , cp.post, cp.put, cp.delete "
  puts "#{cp}"
  puts
  IRB.start_session(binding)
end