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
      nop -4
      acc +6
    PROGRAM

    computer.run

    expect(computer.accumulator).to eq(8)
  end

  it "works by replacing the last jmp instruction" do
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

    expect(computer.accumulator).to eq(8)
  end
end
