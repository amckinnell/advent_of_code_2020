require_relative "configure_zeitwerk"

boarding_pass = BoardingPass.new
boarding_pass_codes = File.foreach("../input_05.txt").map(&:chomp)

missing_boarding_pass_codes = boarding_pass.all - boarding_pass_codes

missing_seat_ids = missing_boarding_pass_codes
  .map { |missing_boarding_pass_code| boarding_pass.seat_id(missing_boarding_pass_code) }

pruned_from_front_missing_seat_ids =
  missing_seat_ids.drop_while.with_index { |id, i| id + 1 == missing_seat_ids[i + 1] }

pruned_from_back_missing_seat_ids =
  missing_seat_ids.reverse.drop_while.with_index { |id, i| id - 1 == missing_seat_ids.reverse[i + 1] }

p (pruned_from_front_missing_seat_ids & pruned_from_back_missing_seat_ids)[1]
