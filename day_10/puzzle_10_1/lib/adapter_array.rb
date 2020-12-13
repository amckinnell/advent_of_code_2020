class AdapterArray
  def initialize(data)
    @data = data.lines.map(&:to_i)
  end

  def joltage_rating
    -1
  end
end
