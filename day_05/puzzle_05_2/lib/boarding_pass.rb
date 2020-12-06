#
# Knows how to decode a boarding pass to a seat ID
#
class BoardingPass
  def all
    all_row_codes.product(all_col_codes).map(&:flatten).map(&:join)
  end

  def seat_id(boarding_pass)
    row = binary_search(row_codes(boarding_pass))
    col = binary_search(col_codes(boarding_pass))

    (row * 8) + col
  end

  private

  def all_row_codes
    row_codes = %w[F B]

    6.times do
      row_codes = row_codes.product(%w[F B]).map(&:flatten)
    end

    row_codes
  end

  def all_col_codes
    col_codes = %w[L R]

    2.times do
      col_codes = col_codes.product(%w[L R]).map(&:flatten)
    end

    col_codes
  end

  def row_codes(boarding_pass)
    boarding_pass.chars.slice(0..6).map(&method(:normalize_row_code))
  end

  def col_codes(boarding_pass)
    boarding_pass.chars.slice(7..9).map(&method(:normalize_col_code))
  end

  def normalize_row_code(row_code)
    case row_code
    when "F"
      :lower
    when "B"
      :upper
    end
  end

  def normalize_col_code(row_code)
    case row_code
    when "L"
      :lower
    when "R"
      :upper
    end
  end

  # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
  def binary_search(codes)
    range = [0, 2 ** codes.length - 1] # rubocop:disable Layout/SpaceAroundOperators

    while codes.any?
      midpoint = range[0] + ((range[1] - range[0]) + 1) / 2

      range =
        case codes[0]
        when :lower
          [range[0], midpoint - 1]
        when :upper
          [midpoint, range[1]]
        end

      codes.shift
    end

    raise "Incorrect termination condition: #{range}" if range[0] != range[1]

    range.first
  end

  # rubocop:enable Metrics/AbcSize,Metrics/MethodLength
end
