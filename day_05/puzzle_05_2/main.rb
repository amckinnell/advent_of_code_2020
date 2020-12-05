require_relative "configure_zeitwerk"

boarding_pass = BoardingPass.new
boarding_pass_codes = File.foreach("../input_05.txt").map(&:chomp)

highest_seat_id = boarding_pass_codes
  .map { |boarding_pass_code| boarding_pass.seat_id(boarding_pass_code) }
  .max

pp highest_seat_id
