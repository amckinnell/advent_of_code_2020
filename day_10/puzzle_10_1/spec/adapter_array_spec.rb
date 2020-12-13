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

    result = array_adapter.joltage_rating

    expect(result).to eq(22)
  end
end
