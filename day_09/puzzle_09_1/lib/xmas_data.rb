class XmasData
  def initialize(data, preamble: 25)
    @data = data
    @preamble = preamble
  end

  def bad_encoding
    :tbd
  end
end
