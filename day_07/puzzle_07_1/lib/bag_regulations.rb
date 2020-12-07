class BagRegulations
  def initialize(bag_regulation_input)
    @bag_regulation_input = bag_regulation_input

    @outermost_bag_colors_found = []
  end

  def find_outermost_bag_colors
    @bag_regulation_input.each do |bag_regulations|
      outermost_colors = colors_for_bag_regulations(bag_regulations[0], bag_regulations)

      @outermost_bag_colors_found.concat(outermost_colors)
    end

    @outermost_bag_colors_found.uniq
  end

  private

  def colors_for_bag_regulations(outermost_bag_color, bag_regulations)
    bag_regulations[1].each_with_object([]) do |bag_regulation, memo|
      colors = if bag_regulation == "shiny gold"
        [outermost_bag_color]
      else
        colors_for_bag_regulations(outermost_bag_color, [bag_regulation, @bag_regulation_input[bag_regulation]])
      end

      memo.concat(colors)
    end
  end
end
