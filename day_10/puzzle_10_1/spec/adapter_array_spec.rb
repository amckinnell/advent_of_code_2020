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

    result = array_adapter.joltage_differences

    expect(result).to eq([1, 3, 1, 1, 1, 3, 1, 1, 3, 1, 3, 3])
  end
end
