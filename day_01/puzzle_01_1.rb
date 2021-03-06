solution = File
  .foreach("input_01.txt")
  .map(&:to_i)
  .permutation(2)
  .detect { |p| p.sum == 2020 }
  .reduce(:*)

puts solution
