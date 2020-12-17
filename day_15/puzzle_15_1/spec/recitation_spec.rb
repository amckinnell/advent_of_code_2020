RSpec.describe Recitation do
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

      expect(recitation.last_spoken).to eq(expected_last_spoken), "#{recitation.history.reverse.take(5)}"
    end
  end
end
