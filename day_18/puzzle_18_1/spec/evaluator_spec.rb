RSpec.describe Evaluator do
  examples =
    [
      [[2], 2],
      [[2, 3, :+], 5],
      [[2, 3, 2, :*, :+], 8],
      [[2, 3, :+, 2, :*], 10],
    ]

  examples.each do |rpn_expression, expected_result|
    it "evaluates '#{rpn_expression}' to #{expected_result}" do
      evaluator = Evaluator.new(rpn_expression)

      result = evaluator.evaluate

      expect(result).to eq(expected_result)
    end
  end
end
