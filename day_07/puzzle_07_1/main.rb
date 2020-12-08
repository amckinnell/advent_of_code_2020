require_relative "configure_zeitwerk"

bag_regulation_input = BagRegulationsInput.new(File.read("../input_07.txt")).parsed_input

bag_regulations = BagRegulations.new(bag_regulation_input)

outermost_bag_colors = bag_regulations.find_outermost_bag_colors

p outermost_bag_colors.count
