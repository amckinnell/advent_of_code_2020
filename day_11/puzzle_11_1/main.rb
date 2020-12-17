require_relative "configure_zeitwerk"

seating_system = SeatingSystem.new(File.read("../input_11.txt"))
rounds = 0

loop do
  seating_system.next_round

  break unless seating_system.changed?

  rounds += 1
  raise "Too many rounds" if 100 < rounds
end

p "#{seating_system.occupied_seats} occupied_seats after #{rounds} rounds"
