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

  def encryption_weakness
    contiguous_set = continuous_set_matching(bad_encoding)

    contiguous_set.min + contiguous_set.max
  end

  private

  def continuous_set_matching(target_sum)
    (0..@data.length).step do |current_start_index|
      current_end_index = current_start_index
      current_sum = 0

      loop do
        current_sum += @data[current_end_index]
        current_end_index += 1

        if current_sum == target_sum
          return @data.slice(current_start_index, current_end_index - current_start_index)
        end

        break if target_sum < current_sum
        break if @data.length < current_end_index
      end
    end

    raise "No contiguous set with a sum of #{target_sum}"
  end

  def invalid_encoding?(n)
    !valid_encoding?(n)
  end

  def valid_encoding?(n)
    preamble = @data.slice(n - @preamble_length, @preamble_length)

    valid_encodings = preamble.permutation(2).map(&:sum).uniq

    valid_encodings.include? @data[n]
  end
end
