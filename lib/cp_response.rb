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
    pretty   
  end

  def html
    puts CodeRay.scan(json, :json).div
  end
end
