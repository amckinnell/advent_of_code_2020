class Solution
  attr_reader :location, :row_increment, :col_increment

  def initialize(location, row_increment, col_increment)
    @location = location
    @row_increment = row_increment
    @col_increment = col_increment
  end

  def run
    row = 0
    col = 0
    trees = 0

    while row < location.rows
      trees += 1 if location.tree_at?(row, col)

      row += row_increment
      col += col_increment
    end

    trees
  end
end

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

if $PROGRAM_NAME == __FILE__
  location = Location.new("input_03.txt")

  slopes = [
    [1, 1],
    [1, 3],
    [1, 5],
    [1, 7],
    [2, 1]
  ]

  p slopes.map { |slope| Solution.new(location, *slope).run }.reduce(:*)
end
