class CpResponse
  def initialize
    @result = yield
  rescue => e
    @result = e
  end

  def pretty
    JSON.pretty_unparse(JSON.parse(@result))
  end

  def to_hash
    JSON.parse(@result)
  end

  def to_s
    pretty
  end
end
