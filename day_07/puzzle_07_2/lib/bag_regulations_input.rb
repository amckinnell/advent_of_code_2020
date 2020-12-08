class BagRegulationsInput
  def initialize(input)
    @input = input
  end

  def parsed_input
    @input.split("\n").map { |line| parse_line(line) }.to_h
  end

  private

  def parse_line(line)
    # "clear red bags contain 2 blue bags, 4 light brown bags." ->
    #   ["clear red bags", "2 blue bags 4 light brown bags"]
    raw_outer_bag, raw_inner_bags = line.gsub(/[,.]/, "").split("contain").map(&:strip)

    # "clear red bags" -> "clear red"
    outer_bag = raw_outer_bag.gsub(/ bags/, "")

    # "1 blue bag 4 light brown bags" -> ["1 blue", "4 light brown"]
    inner_bags = raw_inner_bags.split(/bags?/).map(&:strip)

    if inner_bags == ["no other"]
      # ["no other"] -> []
      inner_bags = []
    end

    # ["clear red", ["1 blue", "4 light brown"]]
    [outer_bag, inner_bags]
  end
end
