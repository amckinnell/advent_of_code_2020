class ComputerFixer
  def initialize(program)
    @program = program

    @ip = 0
  end

  def each
    loop do
      raise StopIteration if @ip == @program.length

      instruction = @program[@ip]

      case instruction
      when /nop/
        fixer = @program.dup
        fixer[@ip] = fixer[@ip].gsub(/nop/, "jmp")

        yield fixer

        @ip += 1

      when /acc/
        @ip += 1

      when /jmp/
        fixer = @program.dup
        fixer[@ip] = fixer[@ip].gsub(/jmp/, "nop")

        yield fixer

        @ip += 1

      else
        raise "Unknown instruction"
      end
    end
  end
end
