require_relative "configure_zeitwerk"

operation_orders = OperationOrders.new(File.read("../input_18.txt"))

p operation_orders.evaluate.sum

# Correct answer: 870
