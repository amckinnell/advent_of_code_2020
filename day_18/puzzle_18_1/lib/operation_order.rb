class OperationOrder
  def initialize(raw_data)
    @raw_data = raw_data

  end

  def evaluate
    @raw_data.lines.map { |raw_line| evaluate_line(tokenize(raw_line.chomp)) }
  end

  private

  def evaluate_line(tokens)
    tokens.first.to_i
  end

  def tokenize(line)
    line.split(" ")
  end
end
