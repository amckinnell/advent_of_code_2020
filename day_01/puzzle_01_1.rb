solution = File
  .foreach("input_01.txt")
  .map(&:to_i)
  .permutation(2)
  .select { |p| p.sum == 2020 }
  .first
  .inject(&:*)

puts solution
