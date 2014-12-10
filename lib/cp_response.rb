class CpResponse

  def initialize
    @result = yield
  rescue => e
    @result = e
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
    highlighted(json(@result.http_body)).terminal
  end

  def to_s
    return pretty if @result.is_a? String
    pretty_error
  end

  def html
    puts CodeRay.scan(json, :json).div
  end
end
