OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
class CpSession
  include CpConfig

  def initialize
    client = OAuth2::Client.new(CLIENTID,
                                CLIENTSECRET,
                                :site => "https://#{HOST}",
                                :token_url => '/oauth/access_token', 
                                :ssl_verify => false
                                )

    @token = client.client_credentials.get_token.token
    @api_url = "https://#{HOST}/"
    @auth = { 'Authorization' => "Bearer #{@token}" }
    @common = @auth.merge(accept: :json, content_type: :json)
  end

  def get(endpoint, params = {})
    v = params[:version] || "1" 
    CpResponse.new { RestClient.get @api_url + "v#{v}/#{endpoint}", @common.merge(params: params) }
  end

  def post(endpoint, params)
    v = params[:version] || "1" 
    CpResponse.new { RestClient.post @api_url + "v#{v}/#{endpoint}", params, @common }
  end

  def put(endpoint, params)
    v = params[:version] || "1" 
    CpResponse.new { RestClient.put @api_url + "v#{v}/#{endpoint}", params, @common }
  end

  def delete(endpoint)
    v = params[:version] || "1" 
    CpResponse.new { RestClient.delete @api_url + "v#{v}/#{endpoint}", @common }
  end
end
