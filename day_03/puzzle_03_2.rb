class Location
  def initialize(filename)
    @filename = filename
  end

  def location
    @_location ||= File.foreach(@filename).map { |line| line.chomp.chars }
  end

  def rows
    @_rows ||= location.size
  end

  def cols
    @_cols ||= location.first.size
  end

  def tree_at?(row, col)
    location[row][col % cols] == "#"
  end
end

class SlopeEnumerator
  def initialize(stop_row, slope)
    @stop_row = stop_row
    @row_increment, @col_increment = slope

    @row, @col = 0, 0
  end

  def each
    loop do
      raise StopIteration unless @row < @stop_row

      yield @row, @col

      @row += @row_increment
      @col += @col_increment
    end
  end
end

if $PROGRAM_NAME == __FILE__
  location = Location.new("input_03.txt")

  slopes = [
    [1, 1],
    [1, 3],
    [1, 5],
    [1, 7],
    [2, 1]
  ]

  slope_enumerators = slopes.map { |slope| SlopeEnumerator.new(location.rows, slope).enum_for }

  p slope_enumerators
    .map { |slope_enumerator| slope_enumerator.count { |row, col| location.tree_at?(row, col) } }
    .reduce(:*)
end
