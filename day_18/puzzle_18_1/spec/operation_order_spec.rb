RSpec.describe OperationOrder do
  describe "simple cases" do
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

  it "example from problem statement" do
    operation_order = OperationOrder.new("1 + 2 * 3 + 4 * 5 + 6")
    result = operation_order.evaluate

    expect(result).to eq(71)
  end
end
