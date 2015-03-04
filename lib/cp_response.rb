class CpResponse
  attr_reader :result

  def initialize
    @result = yield
  end

  def to_hash
    JSON.parse(@result.body)
  end

  def json(json)
    JSON.pretty_unparse(JSON.parse(json))
  end

  def highlighted(json)
    CodeRay.scan(json, :json)
  end

  def pretty
    highlighted(json(@result.body)).terminal
  end

  def to_s
    return pretty if @result.status == 200
    return nil if @result.status == 204
    return pretty if @result.status == 422
    return nil if @result.status == 404
    return "created" if @result.status == 201
    return "bad request" if @result.status == 400
    highlighted(@result.body)
  end

  def html
    puts CodeRay.scan(json, :json).div
  end
end
