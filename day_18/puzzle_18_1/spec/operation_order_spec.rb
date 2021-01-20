RSpec.describe OperationOrder do
  describe "simple cases" do
    it "simple token" do
      operation_order = OperationOrder.new("2")
      result = operation_order.evaluate

      expect(result).to eq(2)
    end

    xit "simple binary + expression" do
      operation_order = OperationOrders.new("1 + 2")

      result = operation_order.evaluate

      expect(result).to eq(3)
    end

    xit "simple binary * expression" do
      operation_order = OperationOrders.new("2 * 3")

      result = operation_order.evaluate

      expect(result).to eq(6)
    end

    xit "compound expression" do
      operation_order = OperationOrders.new("2 + 2 * 3")

      result = operation_order.evaluate

      expect(result).to eq(12)
    end
  end
end
