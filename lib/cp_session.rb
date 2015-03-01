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
        accept: :json,
        content_type: :json,
        'Authorization' => "Bearer #{@token}"
    }
    @version = "1"
  end

  def cp_request(action, endpoint, params)
    v = params.delete(:version) || @version
    url = @api_url + "v#{v}/#{endpoint}"
    payload = params
    headers = @common
    RestClient.send(action, url, payload, headers ) unless [:get, :delete].include?(action)
    RestClient.send(action, url, headers )
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
