RSpec.describe Recitation do
  it "works" do
    recitation = Recitation.new([0, 3, 6])

    expect(recitation.next_number).to eq(0)
    expect(recitation.next_number).to eq(3)
    expect(recitation.next_number).to eq(3)
    expect(recitation.next_number).to eq(1)
    expect(recitation.next_number).to eq(0)
    expect(recitation.next_number).to eq(4)
    expect(recitation.next_number).to eq(0)
    expect(recitation.next_number).to eq(2)
    expect(recitation.next_number).to eq(0)
    expect(recitation.next_number).to eq(2)
    expect(recitation.next_number).to eq(2)
    expect(recitation.next_number).to eq(1)
    expect(recitation.next_number).to eq(8)
    expect(recitation.next_number).to eq(0)
    expect(recitation.next_number).to eq(5)
    expect(recitation.next_number).to eq(0)
    expect(recitation.next_number).to eq(2)
    expect(recitation.next_number).to eq(6)
    expect(recitation.next_number).to eq(18)
    expect(recitation.next_number).to eq(0)
    expect(recitation.next_number).to eq(4)
    expect(recitation.next_number).to eq(15)
    expect(recitation.next_number).to eq(0)
    expect(recitation.next_number).to eq(3)
    expect(recitation.next_number).to eq(21)
    expect(recitation.next_number).to eq(0)
    expect(recitation.next_number).to eq(3)
    expect(recitation.next_number).to eq(3)
    expect(recitation.next_number).to eq(1)
    expect(recitation.next_number).to eq(17)
    expect(recitation.next_number).to eq(0)
  end

  [
    [[0, 3, 6], 175_594],
    [[1, 3, 2], 2_578],
    [[2, 1, 3], 3_544_142],
    [[1, 2, 3], 261_214],
    [[2, 3, 1], 6_895_259],
    [[3, 2, 1], 18],
    [[3, 1, 2], 362]
  ].each do |starting, expected_last_spoken|
    it "starting with #{starting} then #{expected_last_spoken} is the last number spoken" do
      recitation = Recitation.new(starting)

      loop do
        recitation.next_number

        break if recitation.turn == 30_000_000
      end

      expect(recitation.last_spoken).to eq(expected_last_spoken)
    end
  end
end
