#!/usr/bin/env ruby
require 'awesome_print'
require './lib/cp_config.rb'
require './lib/cp_response.rb'
require './lib/cp_session.rb'
require './lib/cp_irb.rb'

puts "CloudPassage API Ruby Command Line Interface"
puts "********************************************"

cp = CpSession.new()
puts " Now you can call: cp.get , cp.post, cp.put, cp.delete "
puts "#{cp}"
puts

IRB.start_session(binding)
