class CpSession
  include CpConfig

  def initialize
    client = OAuth2::Client.new(CLIENTID,
                                CLIENTSECRET,
                                :site => "https://#{HOST}",
                                :token_url => '/oauth/access_token',
                                :ssl => {:verify => false})

    @token = client.client_credentials.get_token.token
    @api_url = "https://#{HOST}/v1/"
    @auth = {'Authorization' => "Bearer #{@token}"}

  end

  def get(endpoint)
    CpResponse.new(RestClient.get @api_url+"#{endpoint}", @auth)
  end

  def post(endpoint, params)
    CpResponse.new(RestClient.post @api_url+"#{endpoint}.json", params, @auth)

  end

  def put(endpoint, params)
    CpResponse.new(RestClient.put @api_url+"#{endpoint}.json", params, @auth)
  end

  def delete(endpoint)
    CpResponse.new(RestClient.delete @api_url+"#{endpoint}", @auth)
  end

end
