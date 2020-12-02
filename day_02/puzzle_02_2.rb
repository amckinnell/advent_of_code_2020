def valid_password?(line)
  m = /(?<first>\d+)-(?<second>\d+) (?<character>[a-z]): (?<password>.+)/.match(line)

  index_1 = m[:first].to_i - 1
  index_2 = m[:second].to_i - 1

  (m[:password][index_1] == m[:character]) ^ (m[:password][index_2] == m[:character])
end

puts File.foreach("input_02.txt").count { |line| valid_password?(line.chomp) }
