class CpResponse

  def initialize (args)
    @result = args
  end

  def jpp
    puts JSON.pretty_unparse(JSON.parse(@result))
  end

  def to_hash
    JSON.parse(@result)
  end

end