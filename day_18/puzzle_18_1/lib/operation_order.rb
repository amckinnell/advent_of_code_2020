class OperationOrder
  def initialize(raw_line)
    @raw_line = raw_line
  end

  def evaluate
    @raw_line.to_i
  end
end
