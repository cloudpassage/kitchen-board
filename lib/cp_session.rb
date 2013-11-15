class CpSession
  include CpConfig

  def initialize
    client = OAuth2::Client.new(CLIENTID,
                                CLIENTSECRET,
                                :site => "https://#{HOST}",
                                :token_url => '/oauth/access_token'
                                )

    @token = client.client_credentials.get_token.token
    @api_url = "https://#{HOST}/v1/"
    @auth = {'Authorization' => "Bearer #{@token}"}
    @common = @auth.merge({:accept => :json, :content_type=>:json})

  end

  def get(endpoint, params={})
    CpResponse.new{RestClient.get @api_url+"#{endpoint}", @common.merge(params:params)}
  end

  def post(endpoint, params)
    CpResponse.new{RestClient.post @api_url+"#{endpoint}", params, @common}

  end

  def put(endpoint, params)
    CpResponse.new{RestClient.put @api_url+"#{endpoint}", params, @common}
  end

  def delete(endpoint)
    CpResponse.new{RestClient.delete @api_url+"#{endpoint}", @common}
  end

end
