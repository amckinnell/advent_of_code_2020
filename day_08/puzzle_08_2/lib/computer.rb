class Computer
  def initialize(program)
    @program = program

    @ip = 0
    @acc = 0

    @executed = []
  end

  def run
    loop do
      if @executed.include?(@ip)
        @acc = :infinite_loop
        break
      end

      break if @ip == @program.length

      instruction = @program[@ip]
      @executed <<= @ip

      case instruction
      when /nop/
        @ip += 1

      when /acc/
        @acc += instruction.delete("acc ").to_i
        @ip += 1

      when /jmp/
        @ip += instruction.delete("jmp ").to_i

      else
        raise "Unknown instruction"
      end
    end
  end

  def accumulator
    @acc
  end
end
