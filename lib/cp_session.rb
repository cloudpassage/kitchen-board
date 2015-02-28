class CpSession
  include CpConfig
  attr_accessor :version

  def initialize
    client = OAuth2::Client.new(CLIENTID,
                                CLIENTSECRET,
                                :site => "https://#{HOST}",
                                :token_url => '/oauth/access_token'
    )

    @token = client.client_credentials.get_token.token
    @api_url = "https://#{HOST}/"
    @common = {
        accept: :json,
        content_type: :json,
        'Authorization' => "Bearer #{@token}"
    }
    @version = "1"
  end

  def get(endpoint, params = {})
    v = params.delete(:version) || @version
    CpResponse.new { RestClient.get @api_url + "v#{v}/#{endpoint}", @common.merge(params) }
  end

  def post(endpoint, params = {})
    v = params.delete(:version) || @version
    CpResponse.new { RestClient.post @api_url + "v#{v}/#{endpoint}", @common.merge(params) }
  end

  def put(endpoint, params = {})
    v = params.delete(:version) || @version
    CpResponse.new { RestClient.put @api_url + "v#{v}/#{endpoint}", @common.merge(params) }
  end

  def delete(endpoint, params = {})
    v = params.delete(:version) || @version
    CpResponse.new { RestClient.delete @api_url + "v#{v}/#{endpoint}", @common.merge(params) }
  end

end
