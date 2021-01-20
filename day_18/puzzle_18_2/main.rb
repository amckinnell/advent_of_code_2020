require_relative "configure_zeitwerk"

expressions = File.read("../input_18.txt").lines

result =
  expressions
    .map { |expression| ShuntingAlgorithm.new(expression.chomp).parse }
    .map { |rpn_expression| Evaluator.new(rpn_expression).evaluate }
    .sum

puts result

# Correct answer: 85660197232452
