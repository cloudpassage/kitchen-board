class CpResponse

  def initialize()
    begin
      @result = yield
    rescue => e
      @result = e
    end
  end

  def pretty
    JSON.pretty_unparse(JSON.parse(@result))
  end

  def to_hash
    JSON.parse(@result)
  end

  def to_s
    @result
  end

end
