class XmasData
  def initialize(data, preamble: 25)
    @data = data.lines.map(&:to_i)
    @preamble_length = preamble
  end

  def bad_encoding
    bad_data_index = (@preamble_length..@data.length)
      .step
      .detect(&method(:invalid_encoding?))

    bad_data_index ? @data[bad_data_index] : :valid_data
  end

  private

  def invalid_encoding?(n)
    !valid_encoding?(n)
  end

  def valid_encoding?(n)
    preamble = @data.slice(n - @preamble_length, @preamble_length)

    valid_encodings = preamble.permutation(2).map(&:sum).uniq

    valid_encodings.include? @data[n]
  end
end
