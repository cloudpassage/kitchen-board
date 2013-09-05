#!/usr/bin/env ruby
require 'json'
require 'rest-client'
require 'oauth2'
require 'awesome_print'
load './cp-irb.rb'

clientid = '8da95b3c'
clientsecret = '363e3486d006370599716df90dc7ab8f'
host = 'bacon.cloudpassage.com:10443'

#clientid = '91bb1a19'
#clientsecret = 'acdabe31844273d40837f0e84d438b47'
#host = 'localhost:3001'

client = OAuth2::Client.new(clientid, clientsecret,
                            :site => "https://#{host}",
                            :token_url => '/oauth/access_token',
                            :ssl => {:verify => false}
)

token = client.client_credentials.get_token.token
api_url = "https://#{host}/v1/"

class CpSession
  def initialize(api_url, token)
    @api_url = api_url
    @token = token
    @auth = {'Authorization' => "Bearer #{@token}"}
  end

  def get(endpoint)
    RestClient.get @api_url+"#{endpoint}", @auth
  end

  def post(endpoint, params)
    RestClient.post @api_url+"#{endpoint}.json", params, @auth
  end

  def put(endpoint, params)
    RestClient.put @api_url+"#{endpoint}.json", params, @auth
  end

  def delete(endpoint)
    RestClient.delete @api_url+"#{endpoint}", params, @auth
  end

  def pp(result)
    puts result = JSON.pretty_unparse(JSON.parse(result))
  end

  def to_hash(result)
    JSON.parse(result)
  end

end
cp = CpSession.new(api_url, token)
puts " Now you can call cp.get and so on "
puts "#{cp}"
IRB.start_session(binding)