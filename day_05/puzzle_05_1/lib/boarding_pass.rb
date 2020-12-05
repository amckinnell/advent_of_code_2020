#
# Knows how to decode a boarding pass to a seat ID
#
class BoardingPass
  attr_reader :boarding_pass

  def initialize(boarding_pass)
    @boarding_pass = boarding_pass
  end

  def seat_id
    @row_range = [0, 127]
    @row_code = boarding_pass.chars.slice(0..6)

    while @row_code.any?
      midpoint = @row_range[0] + ((@row_range[1] - @row_range[0]) + 1) / 2

      @row_range =
        case @row_code[0]
        when "F"
          [@row_range[0], midpoint - 1]
        when "B"
          [midpoint, @row_range[1]]
        end

      @row_code.shift
    end

    if @row_range[0] != @row_range[1]
      raise "Incorrect termination condition: #{@row_range}"
    end

    row = @row_range.first

    @col_range = [0, 7]
    @col_code = boarding_pass.chars.slice(7..9)

    while @col_code.any?
      midpoint = @col_range[0] + ((@col_range[1] - @col_range[0]) + 1) / 2

      @col_range =
        case @col_code[0]
        when "L"
          [@col_range[0], midpoint - 1]
        when "R"
          [midpoint, @col_range[1]]
        end

      @col_code.shift
    end

    if @col_range[0] != @col_range[1]
      raise "Incorrect termination condition: #{@col_range}"
    end

    col = @col_range.first

    row * 8 + col
  end
end
