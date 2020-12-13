class AdapterArray
  attr_reader :data

  def initialize(data)
    @data = data.lines.map(&:to_i).sort
  end

  def joltage_differences
    previous_adapters = data.dup.prepend(0)
    adapters = data.dup.append(device_rating)

    adapters.zip(previous_adapters).map { |adapter, previous_adapter| adapter - previous_adapter }
  end

  private

  def device_rating
    @data.max + 3
  end
end
