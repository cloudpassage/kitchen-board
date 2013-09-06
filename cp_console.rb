#!/usr/bin/env ruby
require 'rest-client'
require 'oauth2'
require 'json'
require 'awesome_print'
require_relative 'cp_config'
require_relative 'cp_response'
require_relative 'cp_session'
require_relative 'cp_irb.rb'


puts "CloudPassage API Ruby Command Line Interface"
puts "********************************************"

cp = CpSession.new()
puts " Now you can call cp.get and so on "
puts "#{cp}"
puts
IRB.start_session(binding)
