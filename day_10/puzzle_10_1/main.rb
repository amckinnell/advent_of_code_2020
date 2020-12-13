adapter_data = File.read("../input_10.txt").lines.map(&:to_i).sort

previous_adapters = adapter_data.dup.prepend(0)
adapters = adapter_data.dup.append(adapter_data.max + 3)

joltage_differences = adapters.zip(previous_adapters).map { |adapter, previous_adapter| adapter - previous_adapter }

solution = joltage_differences.tally.slice(1, 3).values.reduce(:*)

p solution
