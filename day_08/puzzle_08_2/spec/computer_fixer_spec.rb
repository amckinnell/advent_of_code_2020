RSpec.describe ComputerFixer do
  it "works" do
    computer_fixer = ComputerFixer.new(<<~PROGRAM.lines.map(&:chomp))
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

    computer_fixer.each do |fixed_program|
      p "#################### fixed_program ####################"
      p fixed_program
    end
  end
end
