class AdapterArray
  def initialize(data)
    @data = data.lines.map(&:to_i)
  end

  def joltage_rating
    -1
  end

  def longest_adapter_sequence
    begin
      search(current_output: 0, adaptor_sequence: [], unused_adapters: @data)
    rescue FoundAdaptorSequence => e
      return e.adapter_sequence
    end

    raise "No complete adapter sequence found"
  end

  def search(current_output:, adaptor_sequence:, unused_adapters:)
    raise FoundAdaptorSequence.new(adaptor_sequence) if unused_adapters.empty?

    next_adapters = eligible_adapters(current_output, unused_adapters)

    return adaptor_sequence if next_adapters.empty?

    next_adapters.each do |next_adapter|
      search(
        current_output: next_adapter,
        adaptor_sequence: adaptor_sequence.append(next_adapter),
        unused_adapters: unused_adapters - [next_adapter]
        )
    end
  end

  def eligible_adapters(current_output, adapters)
    adapters.select { |adapter| ((current_output) + 1..(current_output + 3)).cover?(adapter) }.sort
  end
end
