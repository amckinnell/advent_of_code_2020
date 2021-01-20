class OperationOrder
  attr_reader :expression

  def initialize(expression)
    @expression = expression
  end

  def evaluate
    tokens = expression.split(" ")
    operator_index = tokens.rindex { |token| ["+", "*"].include?(token) }

    if operator_index
      lhs = tokens.take(operator_index).join(" ")
      operator = tokens[operator_index]
      rhs = tokens.last.to_i

      OperationOrder.new(lhs).evaluate.send(operator, rhs)
    else
      tokens.last.to_i
    end
  end
end
