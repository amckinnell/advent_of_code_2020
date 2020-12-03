class Solution
  attr_reader :row_increment, :col_increment

  def initialize(row_increment, col_increment)
    @row_increment = row_increment
    @col_increment = col_increment
  end

  def run
    row = 0
    col = 0
    trees = 0

    while row < rows
      trees += 1 if tree_at?(row, col)

      row += row_increment
      col += col_increment
    end

    trees
  end

  private

  def location
    @_location ||= File.foreach("input_03.txt").map { |line| line.chomp.chars }
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
  slopes = [
    [1, 1],
    [1, 3],
    [1, 5],
    [1, 7],
    [2, 1]
  ]

  p slopes.map { |slope| Solution.new(*slope).run }.reduce(:*)
end
