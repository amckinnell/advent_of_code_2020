boarding_passes = File.foreach("../input_05.txt").map(&:chomp)

seat_id = ->(boarding_pass) { boarding_pass.tr("FBLR", "0101").to_i(2) }

highest_seat_id = boarding_passes
  .map(&seat_id)
  .max

pp highest_seat_id
