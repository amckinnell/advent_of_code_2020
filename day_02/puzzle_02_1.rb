def valid_password?(line)
  m = /(?<first>\d+)-(?<second>\d+) (?<character>.): (?<password>.+)/.match(line)

  repetition = m[:first].to_i..m[:second].to_i
  character_count = m[:password].chars.count { |c| c == m[:character] }

  repetition.include?(character_count)
end

puts File.foreach("input_02.txt").count { |line| valid_password?(line.chomp) }
