RSpec.describe OperationOrder do
  describe "simple cases without parentheses" do
    it "simple value" do
      operation_order = OperationOrder.new("2")
      result = operation_order.evaluate

      expect(result).to eq(2)
    end

    it "simple binary + expression" do
      operation_order = OperationOrder.new("1 + 2")

      result = operation_order.evaluate

      expect(result).to eq(3)
    end

    it "simple binary * expression" do
      operation_order = OperationOrder.new("2 * 3")

      result = operation_order.evaluate

      expect(result).to eq(6)
    end

    it "compound expression" do
      operation_order = OperationOrder.new("2 + 2 * 3")

      result = operation_order.evaluate

      expect(result).to eq(12)
    end
  end

  describe "simple cases with parentheses" do
    it "simple value" do
      operation_order = OperationOrder.new("(2)")
      result = operation_order.evaluate

      expect(result).to eq(2)
    end

    it "simple binary + expression" do
      operation_order = OperationOrder.new("(1 + 2)")

      result = operation_order.evaluate

      expect(result).to eq(3)
    end

    it "simple binary * expression" do
      operation_order = OperationOrder.new("(2 * 3)")

      result = operation_order.evaluate

      expect(result).to eq(6)
    end

    it "compound expression" do
      operation_order = OperationOrder.new("2 + (2 * 3)")

      result = operation_order.evaluate

      expect(result).to eq(8)
    end

    it "compound expression" do
      operation_order = OperationOrder.new("(2 + 2) * 3")

      result = operation_order.evaluate

      expect(result).to eq(12)
    end
  end

  describe "examples from problem statement" do
    [
      ["1 + 2 * 3 + 4 * 5 + 6", 71],
      ["1 + (2 * 3) + (4 * (5 + 6))", 51],
      ["2 * 3 + (4 * 5)", 26],
      ["5 + (8 * 3 + 9 + 3 * 4 * 3)", 437],
      ["((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2", 13_632],
    ].each do |expression, expected_result|
      it "evaluates #{expression} to #{expected_result}" do
        operation_order = OperationOrder.new(expression)

        result = operation_order.evaluate

        expect(result).to eq(expected_result)
      end
    end
  end
end
