require_relative "configure_zeitwerk"

xmas_data = XmasData.new(File.read("../input_09.txt"))

encryption_weakness = xmas_data.encryption_weakness

p encryption_weakness
