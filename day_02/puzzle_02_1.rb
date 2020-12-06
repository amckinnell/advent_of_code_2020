valid_password = ->(line) {
  m = /(?<first>\d+)-(?<second>\d+) (?<character>[a-z]): (?<password>.+)/.match(line)

  repetition = m[:first].to_i..m[:second].to_i
  character_count = m[:password].chars.count { |c| c == m[:character] }

  repetition.include?(character_count)
}

p File.readlines("input_02.txt", chomp: true).count(&valid_password)
