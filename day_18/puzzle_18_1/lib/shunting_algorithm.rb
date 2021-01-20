#
# See https://en.wikipedia.org/wiki/Shunting-yard_algorithm
#
class ShuntingAlgorithm
  attr_reader :output_queue

  def initialize(raw_data)
    @tokens = raw_data.scan(/\d+|[+*()]/)

    @operator_stack = []
    @output_queue = []
  end

  def evaluate
    @tokens.each do |token|
      case token

      when /\d+/
        output_queue.push(token.to_i)

      when /[+*]/
        while @operator_stack.any? && @operator_stack.last != "("
          output_queue.push(@operator_stack.pop)
        end

        @operator_stack.push(token.to_sym)

      when /\(/
        @operator_stack.push(token)

      when /\)/
        while @operator_stack.last != "("
          output_queue.push(@operator_stack.pop)
        end

        @operator_stack.pop if @operator_stack.last == "("
      end
    end

    while @operator_stack.any?
      output_queue.push(@operator_stack.shift)
    end

    output_queue
  end
end
