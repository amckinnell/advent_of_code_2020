input = File
  .read("../input_06.txt")
  .split("\n\n")
  .map { |answers| answers.split("\n") }

yes_count = ->(group_answers) {
  group_answers
    .map(&:chars)
    .reduce(:|)
    .count
}

yes_total = input
  .map(&yes_count)
  .sum

p yes_total
