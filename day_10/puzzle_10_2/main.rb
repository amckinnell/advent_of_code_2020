require_relative "configure_zeitwerk"

adapter_array = AdapterArray.new(File.read("../input_10.txt"))

joltage_differences = adapter_array.joltage_differences

p "#################### adapter_array.data ####################"
p adapter_array.data

p "#################### adapter_array.joltage_differences.take(adapter_array.joltage_differences.length - 1) ####################"
p adapter_array.joltage_differences.take(adapter_array.joltage_differences.length - 1)

p "#################### adapter_array.joltage_differences.take(adapter_array.joltage_differences.length - 1).chunk_while { |a, b| a == b } ####################"
p adapter_array.joltage_differences.take(adapter_array.joltage_differences.length - 1).chunk_while { |a, b| a == b }.to_a

p "#################### adapter_array.joltage_differences.take(adapter_array.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length) ####################"
p adapter_array.joltage_differences.take(adapter_array.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length)

p "#################### adapter_array.joltage_differences.take(adapter_array.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length).uniq.sort ####################"
p adapter_array.joltage_differences.take(adapter_array.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length).uniq.sort
