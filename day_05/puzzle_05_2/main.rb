require_relative "configure_zeitwerk"

boarding_pass = BoardingPass.new
boarding_pass_codes = File.foreach("../input_05.txt").map(&:chomp)

missing_boarding_pass_codes = boarding_pass.all - boarding_pass_codes

missing_seat_ids = missing_boarding_pass_codes
  .map { |missing_boarding_pass_code| boarding_pass.seat_id(missing_boarding_pass_code) }

p "#################### missing_seat_ids ####################"
p missing_seat_ids
