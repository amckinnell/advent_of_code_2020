class BagRegulations
  def initialize(bag_regulation_input)
    @bag_regulation_input = bag_regulation_input

    @outermost_bag_colors_found = []
  end

  def find_outermost_bag_colors
    @bag_regulation_input.each do |bag_regulations|
      bag_color = bag_regulations[0]
      outermost_colors = colors_for_bag_regulations(bag_color, bag_regulations)

      @outermost_bag_colors_found.concat(outermost_colors)
    end

    @outermost_bag_colors_found.uniq
  end

  private

  def colors_for_bag_regulations(outermost_bag_color, bag_regulations)
    inner_bags = bag_regulations[1]

    inner_bags.each_with_object([]) do |bag, memo|
      if bag == "shiny gold"
        memo.append(outermost_bag_color)
      else
        memo.concat(colors_for_bag_regulations(outermost_bag_color, [bag, @bag_regulation_input[bag]]))
      end
    end
  end
end
