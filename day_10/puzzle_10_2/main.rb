require_relative "configure_zeitwerk"

adapter_array = AdapterArray.new(File.read("../input_10.txt"))

joltage_differences = adapter_array.joltage_differences

solution = joltage_differences.tally.slice(1, 3).values.reduce(:*)

p solution
