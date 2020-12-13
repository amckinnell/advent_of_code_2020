RSpec.describe XmasData do
  it "works" do
    xmas_data = XmasData.new(<<~DATA, preamble: 5)
      35
      20
      15
      25
      47
      40
      62
      55
      65
      95
      102
      117
      150
      182
      127
      219
      299
      277
      309
      576
    DATA

    result = xmas_data.bad_encoding

    expect(result).to eq(127)
  end
end
