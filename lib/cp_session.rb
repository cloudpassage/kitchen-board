class CpSession
  include CpConfig
  attr_writer :version, :client_id, :client_secret, :host

  def get_authorized!(host, client_id, client_secret)
    client = OAuth2::Client.new(
        client_id,
        client_secret,
        :site => "https://#{host}",
        :token_url => '/oauth/access_token'
    )

    @token = client.client_credentials.get_token.token
  end

  def initialize(version: 1, host: HOST, client_id: CLIENT_ID, client_secret: CLIENT_SECRET)
    get_authorized!(host, client_id, client_secret)
    @api_url = "https://#{host}/"
    @common = {
        'Accept' => 'json',
        'Content-type' => 'application/json',
        'Authorization' => "Bearer #{@token}"
    }
    @version = version
  end

  def cp_request(action, endpoint, params)
    url = @api_url + "v#{@version}/#{endpoint}"
    headers = @common
    params_hash = {}
    params_hash = params if params.is_a? Hash
    body = ""
    body = params if params.is_a? String

    conn = Faraday.new(url: url) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    conn.send(action) do |request|
      request.headers = headers
      request.params = params_hash
      request.body = body
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
