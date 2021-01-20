RSpec.describe OperationOrders do
  describe "simple cases without parentheses" do
    it "minimal expression without operator" do
      operation_order = OperationOrders.new(<<~DATA)
        2
        3
      DATA

      result = operation_order.evaluate

      expect(result).to eq([2, 3])
    end

    it "minimal expression with operator" do
      operation_order = OperationOrders.new(<<~DATA)
        1 + 2
      DATA

      result = operation_order.evaluate

      expect(result).to eq([3])
    end
  end
end
