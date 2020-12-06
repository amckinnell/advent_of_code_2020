boarding_passes = File.readlines("../input_05.txt", chomp: true)

seat_id = ->(boarding_pass) { boarding_pass.tr("FBLR", "0101").to_i(2) }

seat_ids = boarding_passes.map(&seat_id)
all_seat_ids = (seat_ids.min..seat_ids.max).to_a

my_seat_id = all_seat_ids - seat_ids

p my_seat_id
