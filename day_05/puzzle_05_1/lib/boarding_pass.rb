#
# Knows how to decode a boarding pass to a seat ID
#
class BoardingPass
  def initialize(boarding_pass)
    @boarding_pass = boarding_pass
  end

  def seat_id
    -1
  end
end
