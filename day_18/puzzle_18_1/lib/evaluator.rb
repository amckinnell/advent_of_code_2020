class Evaluator
  def initialize(rpn_expression)
    @rpn_expression = rpn_expression

    @stack = []
  end

  def evaluate
    @rpn_expression.each do |token|
      case token
      when :+
        @stack.push(@stack.pop + @stack.pop)
      when :*
        @stack.push(@stack.pop * @stack.pop)
      else
        @stack.push(token)
      end
    end

    @stack.last
  end
end
