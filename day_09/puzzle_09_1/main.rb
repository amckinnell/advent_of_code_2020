require_relative "configure_zeitwerk"

xmas_data = XmasData.new(File.read("../input_09.txt"))

bad_encoding = xmas_data.bad_encoding

p bad_encoding

