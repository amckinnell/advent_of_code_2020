class Solution
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def run
    row = 0
    col = 0
    trees = 0

    while row < location.rows
      trees += 1 if location.tree_at?(row, col)

      row += 1
      col += 3
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

  p Solution.new(location).run
end
