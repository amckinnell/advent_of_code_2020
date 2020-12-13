RSpec.describe AdapterArray do
  it "example from Day 10" do
    array_adapter = AdapterArray.new(<<~DATA)
      16
      10
      15
      5
      1
      11
      7
      19
      6
      12
      4
    DATA

    p "#################### array_adapter.data ####################"
    p array_adapter.data

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1) ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1)

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b } ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.to_a

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length) ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length)

    combinations = ->(n) do
      case n
      when 1
        1
      when 2
        2
      when 3
        4
      when 4
        4
      else
        raise "Don't know combinations"
      end
    end

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length) ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length).map(&combinations)

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length).reduce(:* ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length).map(&combinations).reduce(:*)
  end

  it "another from Day 10" do
    array_adapter = AdapterArray.new(<<~DATA)
      28
      33
      18
      42
      31
      14
      46
      20
      48
      47
      24
      23
      49
      45
      19
      38
      39
      11
      1
      32
      25
      35
      8
      17
      7
      9
      4
      2
      34
      10
      3
    DATA

    p "#################### array_adapter.data ####################"
    p array_adapter.data

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1) ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1)

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b } ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.to_a

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length) ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length)

    combinations = ->(n) do
      case n
      when 1
        1
      when 2
        2
      when 3
        4
      when 4
        4
      else
        raise "Don't know combinations"
      end
    end

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length) ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length).map(&combinations)

    p "#################### array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length).reduce(:* ####################"
    p array_adapter.joltage_differences.take(array_adapter.joltage_differences.length - 1).chunk_while { |a, b| a == b }.map(&:length).map(&combinations).reduce(:*)
  end
end
