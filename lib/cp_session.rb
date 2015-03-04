class CpSession
  include CpConfig
  attr_accessor :version

  def get_authorized!
    client = OAuth2::Client.new(
        CLIENTID,
        CLIENTSECRET,
        :site => "https://#{HOST}",
        :token_url => '/oauth/access_token'
    )

    @token = client.client_credentials.get_token.token
  end

  def initialize
    get_authorized!
    @api_url = "https://#{HOST}/"
    @common = {
        'Accept' =>  'json',
        'Content-type' => 'json',
        'Authorization' => "Bearer #{@token}"
    }
    @version = "1"
  end

  def cp_request(action, endpoint, params)
    v = params.delete(:version) || @version
    url = @api_url + "v#{v}/#{endpoint}"
    headers = @common
    Faraday.send(action, url) do |request|
      request.headers = headers
      request.params = params
    end
  end

  def get(endpoint, params = {})
    CpResponse.new { cp_request(:get, endpoint, params) }
  end

  def post(endpoint, params = {})
    CpResponse.new { cp_request(:post, endpoint, params) }
  end

  def put(endpoint, params = {})
    CpResponse.new { cp_request(:put, endpoint, params) }
  end

  def delete(endpoint, params = {})
    CpResponse.new { cp_request(:delete, endpoint, params) }
  end

end
