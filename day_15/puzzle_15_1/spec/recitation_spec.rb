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
    [[1, 3, 2], 1],
    [[2, 1, 3], 10],
    [[1, 2, 3], 27],
    [[2, 3, 1], 78],
    [[3, 2, 1], 438],
    [[3, 1, 2], 1836],
    [[0, 3, 6], 436]
  ].each do |starting, expected_last_spoken|
    it "starting with #{starting} then #{expected_last_spoken} is the last number spoken" do
      recitation = Recitation.new(starting)

      loop do
        recitation.next_number

        break if recitation.turn == 2_020
      end

      expect(recitation.last_spoken).to eq(expected_last_spoken), "#{recitation.history.reverse.take(5)}"
    end
  end
end
