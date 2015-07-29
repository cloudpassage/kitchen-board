require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :console do
  puts "CloudPassage API Ruby Command Line Interface"
  puts "********************************************"
  puts
  cp = CpSession.new()
  puts " Now you can call: cp.get , cp.post, cp.put, cp.delete "
  puts "#{cp}"
  puts
  IRB.start_session(binding)
end
