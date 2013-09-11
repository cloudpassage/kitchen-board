#!/usr/bin/env ruby

require 'rest-client'
require 'oauth2'
require 'json'
require 'awesome_print'

$:<< File.join(File.dirname(__FILE__), './lib')

require 'cp_config'
require 'cp_response'
require 'cp_session'
require 'cp_irb.rb'


puts "CloudPassage API Ruby Command Line Interface"
puts "********************************************"

cp = CpSession.new()
puts " Now you can call cp.get and so on "
puts "#{cp}"
puts
IRB.start_session(binding)
