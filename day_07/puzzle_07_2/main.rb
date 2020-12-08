require_relative "configure_zeitwerk"

bag_regulation_input = BagRegulationsInput.new(File.read("../input_07.txt")).parsed_input

bag_regulations = BagRegulations.new(bag_regulation_input)

shiny_gold_bag_count = bag_regulations.find_shiny_gold_bag_count

p shiny_gold_bag_count
