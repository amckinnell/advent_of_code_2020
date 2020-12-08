require_relative "configure_zeitwerk"

computer = Computer.new(File.readlines("../input_08.txt", chomp: true))

computer.run

p computer.accumulator
