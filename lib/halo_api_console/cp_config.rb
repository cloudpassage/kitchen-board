require 'awesome_print'
require 'faraday'
require 'faraday/detailed_logger'
require 'oauth2'
require 'json'
require 'coderay'

module CpConfig
  CLIENT_ID = ENV['HALO_KEY_ID'] || "invalid"
  CLIENT_SECRET = ENV['HALO_SECRET_KEY'] ||  "invalid"
  HOST = ENV['HALO_HOST'] || "invalid"
end
