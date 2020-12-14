class SeatingSystem
  def initialize(raw_data)
    @raw_data = raw_data

    @grid_data = raw_data.lines.map(&:chomp).map(&:chars)
    @rows = @grid_data.length
    @cols = @grid_data.first.length

    @current_grid = @grid_data
  end

  def display
    @current_grid
      .map { |row| row.join }
      .join("\n")
  end

  def next_round
    next_grid = Array.new(@rows) { Array.new(@cols) }

    (0...@rows).step do |row|
      (0...@cols).step do |col|
        next_grid[row][col] = next_seat(row, col)
      end
    end

    @current_grid = next_grid
  end

  private

  def next_seat(row, col)
    current_seat = @current_grid[row][col]
    occupied_seats = compute_neighbouring_occupied_seats(row, col)

    case current_seat
    when "."
      current_seat
    when "L"
      occupied_seats.zero? ? "#" : current_seat
    when "#"
      4 <= occupied_seats ? "L" : current_seat
    end
  end

  def compute_neighbouring_occupied_seats(r, c)
    neighbourhood_offsets
      .map { |n_r, n_c| [n_r + r, n_c + c] }
      .select { |g_r, g_c| (0...@rows).include?(g_r) && (0...@cols).include?(g_c) }
      .map { |g_r, g_c| @current_grid[g_r][g_c] }
      .count { |seat| seat == "#" }
  end

  def neighbourhood_offsets
    @_neighbourhood_offsets ||=
      [
        [-1, -1], [-1, 0], [-1, 1],
        [0, -1], [0, 1],
        [1, -1], [1, 0], [1, 1],
      ]
  end
end
