class CpResponse

  def initialize
    @result = yield
  rescue => e
    @result = e
  end

  def to_hash
    JSON.parse(@result)
  end

  def json
    json = JSON.pretty_unparse(JSON.parse(@result))
  end

  def highlighted
    CodeRay.scan(json, :json)
  end  

  def pretty
    highlighted.terminal
  end

  def to_s
    return pretty if @result.is_a? String
    @result.inspect
  end

  def html
    puts CodeRay.scan(json, :json).div
  end   
end
