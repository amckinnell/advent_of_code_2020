RSpec.describe ShuntingAlgorithm do
  examples =
    [
      ["2", [2]],
      ["2 + 3", [2, 3, :+]],
      ["2 + (3 * 2)", [2, 3, 2, :*, :+]],
      ["(2 + 3) * 2", [2, 3, :+, 2, :*]],
      ["1 + 2 * 3 + 4 * 5 + 6", [1, 2, :+, 3, 4, :+, 5, 6, :+, :*, :*]]
    ]

  examples.each do |expression, expected_result|
    it "transforms '#{expression}' to #{expected_result}" do
      shunting_algorithm = ShuntingAlgorithm.new(expression)

      result = shunting_algorithm.parse

      expect(result).to eq(expected_result)
    end
  end
end
