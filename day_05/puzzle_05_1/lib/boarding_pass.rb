#
# Knows how to decode a boarding pass to a seat ID
#
class BoardingPass
  attr_reader :boarding_pass

  def initialize(boarding_pass)
    @boarding_pass = boarding_pass
  end

  def seat_id
    boarding_pass.tr("F", "0").tr("B", "1").tr("L", "0").tr("R", "1").to_i(2)
  end
end
