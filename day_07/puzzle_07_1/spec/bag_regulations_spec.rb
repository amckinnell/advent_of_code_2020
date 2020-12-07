RSpec.describe BagRegulations do
  it "no containing bag" do
    bag_regulation_input =
      {
        "faded blue" => []
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    outermost_bag_colors = bag_regulations.find_outermost_bag_colors

    expect(outermost_bag_colors).to be_empty
  end

  it "one containing bag" do
    bag_regulation_input =
      {
        "bright white" => ["shiny gold"],
        "faded blue" => []
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    outermost_bag_colors = bag_regulations.find_outermost_bag_colors

    expect(outermost_bag_colors).to contain_exactly("bright white")
  end

  it "two containing bags" do
    bag_regulation_input =
      {
        "bright white" => ["shiny gold"],
        "faded blue" => [],
        "muted yellow" => ["shiny gold", "faded blue"]
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    outermost_bag_colors = bag_regulations.find_outermost_bag_colors

    expect(outermost_bag_colors).to contain_exactly("bright white", "muted yellow")
  end

  it "transitive containing bags" do
    bag_regulation_input =
      {
        "bright white" => ["shiny gold"],
        "faded blue" => [],
        "light red" => ["bright white", "muted yellow"],
        "muted yellow" => ["shiny gold", "faded blue"]
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    outermost_bag_colors = bag_regulations.find_outermost_bag_colors

    expect(outermost_bag_colors).to contain_exactly("bright white", "light red", "muted yellow")
  end

  it "sample from problem description" do
    bag_regulation_input =
      {
        "bright white" => ["shiny gold"],
        "dark olive" => ["faded blue", "dotted black"],
        "dark orange" => ["bright white", "muted yellow"],
        "dotted black" => [],
        "faded blue" => [],
        "light red" => ["bright white", "muted yellow"],
        "muted yellow" => ["shiny gold", "faded blue"],
        "shiny gold" => ["dark olive", "vibrant plum"],
        "vibrant plum" => ["faded blue", "dotted black"]
         }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    outermost_bag_colors = bag_regulations.find_outermost_bag_colors

    expect(outermost_bag_colors).to contain_exactly("bright white", "dark orange", "light red", "muted yellow")
  end
end
