require_relative "configure_zeitwerk"

recitation = Recitation.new(11, 0, 1, 10, 5, 19)

loop do
  recitation.next_number

  break if recitation.turn == 30_000_000
end

p recitation.last_spoken

# Correct answer: ???
