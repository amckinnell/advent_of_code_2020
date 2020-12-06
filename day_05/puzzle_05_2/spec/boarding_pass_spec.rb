RSpec.describe BoardingPass do
  subject(:boarding_pass) { described_class.new }

  describe "generates boarding pass codes" do
    it "all for full-sized plane" do
      boarding_pass_codes = boarding_pass.all

      expect(boarding_pass_codes.size).to eq(128 * 8)
      expect(boarding_pass_codes).to include("FFFFFFFLLL", "FFFFFFFRRR", "BBBBBBBLLL", "BBBBBBBRRR")
    end
  end

  describe "decodes a Boarding Pass Code to a Set ID" do
    [
      ["FBFBBFFRLR", 357],
      ["BFFFBBFRRR", 567],
      ["FFFBBBFRRR", 119],
      ["BBFFBBFRLL", 820]
    ].each do |boarding_pass_code, seat_id|
      it "#{boarding_pass_code} to #{seat_id}" do
        seat_id = boarding_pass.seat_id(boarding_pass_code)

        expect(seat_id).to eq(seat_id)
      end
    end
  end

  it "repl" do
    boarding_pass_codes = boarding_pass.all

    expect(boarding_pass_codes.size).to eq(128 * 8)
  end
end
