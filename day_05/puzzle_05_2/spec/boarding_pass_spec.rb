RSpec.describe BoardingPass do
  subject(:boarding_pass) { described_class.new }

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
    seat_id = boarding_pass.seat_id("FBFBBFFRLR")

    expect(seat_id).to eq(357)
  end
end
