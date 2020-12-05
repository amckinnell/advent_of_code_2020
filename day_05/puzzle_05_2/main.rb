require_relative "configure_zeitwerk"

boarding_pass_codes = File.foreach("../input_05.txt").map(&:chomp)

highest_seat_id = boarding_pass_codes
  .map { |boarding_pass_code| BoardingPass.new(boarding_pass_code).seat_id }
  .max

pp highest_seat_id
