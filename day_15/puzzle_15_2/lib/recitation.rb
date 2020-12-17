class Recitation
  attr_reader :history, :last_spoken, :turn

  def initialize(numbers)
    @numbers = numbers

    @history = numbers.map.with_index { |number, index| [number, [index]] }.to_h
    @last_spoken = numbers[2]
    @turn = 3
  end

  def next_number
    result = last_spoken_new? ? 0 : age

    add_to_history(result)

    @last_spoken = result
    @turn += 1

    result
  end

  private

  def add_to_history(result)
    if history.key?(result)
      @history[result] = [@history[result][1], result]
    else
      @history[result] = [turn]
    end
  end

  def age
    history[last_spoken].reduce(:-).abs
  end

  def last_spoken_new?
    !history.key?(last_spoken)
  end
end
