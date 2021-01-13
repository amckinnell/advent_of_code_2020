require_relative "configure_zeitwerk"

navigation_system = NavigationSystem.new(File.read("../input_12.txt"))

p navigation_system.manhattan_distance
