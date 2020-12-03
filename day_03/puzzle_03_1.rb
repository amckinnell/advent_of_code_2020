class Solution
  def run
    row = 0
    col = 0
    trees = 0

    while row < rows
      trees += 1 if tree_at?(row, col)

      row += 1
      col += 3
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
  p Solution.new.run
end
