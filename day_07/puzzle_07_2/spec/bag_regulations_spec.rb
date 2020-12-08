RSpec.describe BagRegulations do
  it "no containing bag" do
    bag_regulation_input =
      {
        "shiny gold" => []
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    find_shiny_gold_bag_count = bag_regulations.find_shiny_gold_bag_count

    expect(find_shiny_gold_bag_count).to eq(0)
  end

  it "single containing bag" do
    bag_regulation_input =
      {
        "shiny gold" => ["12 dark red"],
        "dark red" => []
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    find_shiny_gold_bag_count = bag_regulations.find_shiny_gold_bag_count

    expect(find_shiny_gold_bag_count).to eq(12)
  end

  it "multiple containing bags" do
    bag_regulation_input =
      {
        "shiny gold" => ["2 dark red", "3 dark orange"],
        "dark orange" => [],
        "dark red" => [],
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    find_shiny_gold_bag_count = bag_regulations.find_shiny_gold_bag_count

    expect(find_shiny_gold_bag_count).to eq(5)
  end

  it "nested containing bags" do
    bag_regulation_input =
      {
        "shiny gold" => ["2 dark red"],
        "dark red" => ["4 dark orange", "3 dark yellow"],
        "dark orange" => [],
        "dark yellow" => []
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    find_shiny_gold_bag_count = bag_regulations.find_shiny_gold_bag_count

    expect(find_shiny_gold_bag_count).to eq(16)
  end

  it "example from problem statement" do
    bag_regulation_input =
      {
        "bright white" => ["1 shiny gold"],
        "dark olive" => ["3 faded blue", "4 dotted black"],
        "dark orange" => ["3 bright white", "4 muted yellow"],
        "dotted black" => [],
        "faded blue" => [],
        "light red" => ["1 bright white", "2 muted yellow"],
        "muted yellow" => ["2 shiny gold", "9 faded blue"],
        "shiny gold" => ["1 dark olive", "2 vibrant plum"],
        "vibrant plum" => ["5 faded blue", "6 dotted black"]
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    find_shiny_gold_bag_count = bag_regulations.find_shiny_gold_bag_count

    expect(find_shiny_gold_bag_count).to eq(32)
  end
end
