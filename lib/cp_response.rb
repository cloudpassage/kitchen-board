class CpResponse

  def initialize (args)
    @result = args
  end

  def pretty
    JSON.pretty_unparse(JSON.parse(@result))
  end

  def to_hash
    JSON.parse(@result)
  end
 
  def raw
    @result
  end

end
