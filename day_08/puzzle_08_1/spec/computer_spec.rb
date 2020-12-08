RSpec.describe Computer do
  it "works" do
    computer = Computer.new(<<~PROGRAM.lines.map(&:chomp))
      nop +0
      acc +1
      jmp +4
      acc +3
      jmp -3
      acc -99
      acc +1
      jmp -4
      acc +6
    PROGRAM

    computer.run

    expect(computer.accumulator).to eq(5)
  end
end
