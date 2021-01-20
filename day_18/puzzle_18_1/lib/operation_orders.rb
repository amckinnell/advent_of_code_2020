class OperationOrders
  def initialize(raw_data)
    @raw_data = raw_data

  end

  def evaluate
    @raw_data
      .lines
      .map { |raw_line| OperationOrder.new(raw_line.chomp) }
      .map(&:evaluate)
  end
end
