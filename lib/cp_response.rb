class CpResponse

  def initialize
    @result = yield
  rescue => e
    @error = e
  end

  def to_hash
    JSON.parse(@result)
  end

  def json(json)
    JSON.pretty_unparse(JSON.parse(json))
  end

  def highlighted(json)
    CodeRay.scan(json, :json)
  end

  def pretty
    highlighted(json(@result)).terminal
  end

  def pretty_error
    highlighted(@error.http_body).terminal
  end

  def to_s
    return pretty if @error.nil? && @result
    return nil if @error.http_code == 404
    return nil if @error.http_code == 204
    return pretty_error if @error.http_code == 422
    @error.to_s
  end

  def html
    puts CodeRay.scan(json, :json).div
  end
end
