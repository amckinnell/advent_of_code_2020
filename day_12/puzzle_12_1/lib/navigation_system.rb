class NavigationSystem
  attr_reader :facing, :position

  def initialize(navigation_instructions)
    @navigation_instructions = navigation_instructions

    @facings = [:north, :east, :south, :west]

    @facing = :east
    @position = [0, 0]

    follow_instructions
  end

  def manhattan_distance
    position.each.map { |x| x.abs }.sum
  end

  private

  def follow_instructions
    @navigation_instructions.lines.each do |line|
      follow_instruction(line)
    end
  end

  def follow_instruction(instruction)
    action = instruction[0]
    value = instruction[1..].to_i

    case action
    when "N"
      north(value)
    when "S"
      south(value)
    when "E"
      east(value)
    when "W"
      west(value)
    when "L"
      left(value)
    when "R"
      right(value)
    when "F"
      forward(value)
    else
      raise "Unknown action: '#{action}'"
    end
  end

  def north(value)
    position[1] += value
  end

  def south(value)
    position[1] -= value
  end

  def east(value)
    position[0] += value
  end

  def west(value)
    position[0] -= value
  end

  def right(value)
    rotations = value / 90

    @facing =
      case @facing
      when :north
        @facings[(0 + rotations) % 4]
      when :south
        @facings[(2 + rotations) % 4]
      when :east
        @facings[(1 + rotations) % 4]
      when :west
        @facings[(3 + rotations) % 4]
      else
        raise "Unknown facing: '#{@facing}'"
      end
  end

  def left(value)
    rotations = value / 90

    @facing =
      case @facing
      when :north
        @facings[(0 - rotations) % 4]
      when :south
        @facings[(2 - rotations) % 4]
      when :east
        @facings[(1 - rotations) % 4]
      when :west
        @facings[(3 - rotations) % 4]
      else
        raise "Unknown facing: '#{@facing}'"
      end
  end

  def forward(value)
    case @facing
    when :north
      position[1] += value
    when :south
      position[1] -= value
    when :east
      position[0] += value
    when :west
      position[0] -= value
    else
      raise "Unknown facing: '#{@facing}'"
    end
  end
end
