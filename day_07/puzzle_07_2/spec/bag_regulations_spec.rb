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
        "shiny gold" => ["2 dark red"],
        "dark red" => []
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    find_shiny_gold_bag_count = bag_regulations.find_shiny_gold_bag_count

    expect(find_shiny_gold_bag_count).to eq(2)
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
        "dark red" => ["2 dark orange", "3 dark yellow"],
        "dark orange" => [],
        "dark yellow" => []
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    find_shiny_gold_bag_count = bag_regulations.find_shiny_gold_bag_count

    expect(find_shiny_gold_bag_count).to eq(12)
  end

  it "example from problem statement" do
    bag_regulation_input =
      {
        "shiny gold" => ["2 dark red"],
        "dark red" => ["2 dark orange"],
        "dark orange" => ["2 dark yellow"],
        "dark yellow" => ["2 dark green"],
        "dark green" => ["2 dark blue"],
        "dark blue" => ["2 dark violet"],
        "dark violet" => []
      }

    bag_regulations = BagRegulations.new(bag_regulation_input)

    find_shiny_gold_bag_count = bag_regulations.find_shiny_gold_bag_count

    expect(find_shiny_gold_bag_count).to eq(126)
  end
end
