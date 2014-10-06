class CpResponse

  def initialize
    @result = yield
  rescue => e
    @result = e
  end

  def pretty
    json = JSON.pretty_unparse(JSON.parse(@result))
    Pygments.highlight(json, :formatter => 'terminal', :lexer => 'json', :options => {:encoding => 'utf-8'})
  end

  def to_hash
    JSON.parse(@result)
  end

  def to_s
    return pretty if @result.is_a? String
    @result.inspect
  end
end
