class CpResponse
  attr_reader :result, :status

  def initialize
    @raw = yield
    raise "!!! Implement body and status" unless (@raw.respond_to?(:body) && @raw.respond_to?(:status))
    @result = @raw.body
    @status = @raw.status
  end

  def to_hash
    JSON.parse(@result)
  end

  def json
    @result
  end

  def formatted_json
    JSON.pretty_unparse(self.to_hash)
  end

  def pretty
    highlighted.terminal
  end

  def highlighted
    CodeRay.scan(formatted_json, :json)
  end

  def to_s
    return pretty unless [204, 404, 400, 500].include? @status.to_i
    @status = @result[0..2]
  end

  def html
    puts CodeRay.scan(formatted_json, :formatted_json).div
  end

end
