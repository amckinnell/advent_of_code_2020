class BagRegulations
  def initialize(bag_regulation_input)
    @bag_regulation_input = bag_regulation_input
  end

  def find_shiny_gold_bag_count
    shiny_gold_inner_bags = @bag_regulation_input["shiny gold"]

    shiny_gold_inner_bags.sum(&:to_i)
  end
end
