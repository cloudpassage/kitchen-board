class CpResponse
  def initialize
    begin
      @result = yield
    rescue => e
      @result = e
    end
    puts self.to_s
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
