require_relative "configure_zeitwerk"

computer_fixer = ComputerFixer.new(File.readlines("../input_08.txt", chomp: true))

computer_fixer.each do |program|
  computer = Computer.new(program)

  computer.run

  next if computer.accumulator == :infinite_loop

  p computer.accumulator
end
