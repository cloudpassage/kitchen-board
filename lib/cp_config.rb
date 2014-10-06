require 'rest-client'
require 'oauth2'
require 'json'
require 'pygments'


module CpConfig
  CLIENTID = ENV['HALO_KEY_ID'] || "invalid"
  CLIENTSECRET = ENV['HALO_SECRET_KEY'] ||  "invalid"
  HOST = ENV['HALO_HOST'] || "invalid"
end

RestClient.log = 'stdout'

