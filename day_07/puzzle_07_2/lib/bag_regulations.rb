class BagRegulations
  def initialize(bag_regulation_input)
    @bag_regulation_input = bag_regulation_input
  end

  def find_shiny_gold_bag_count
    inner_bags = @bag_regulation_input["shiny gold"]

    inner_bags.sum { |inner_bag| find_bag_count(inner_bag) }
  end

  private

  def find_bag_count(bag)
    # "2 muted yellow" -> [2, "muted yellow"]
    bag_count = bag.to_i
    bag_color = bag.gsub(/^\d+ /, "")

    inner_bags = @bag_regulation_input[bag_color]

    # Terminating condition for recursion: no inner bags
    return bag_count if inner_bags.empty?

    # "muted yellow" => ["2 shiny gold", "9 faded blue"]
    bag_count + (bag_count * inner_bags.sum { |inner_bag| find_bag_count(inner_bag) })
  end
end
