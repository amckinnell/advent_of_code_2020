class Recitation
  attr_reader :history

  def initialize(numbers)
    @numbers = numbers

    @history = numbers.map.with_index { |number, index| [number, index] }
  end

  def last_spoken
    history.last[0]
  end

  def next_number
    result = previous_number_new? ? 0 : age

    add_to_history(result)

    result
  end

  def turn
    history.length
  end

  private

  def add_to_history(result)
    @history << [result, turn]
  end

  def age
    previous_number = last_spoken

    previous_recitation = history.take(turn - 1).reverse.detect { |number, _age| number == previous_number }

    turn - (previous_recitation[1] + 1)
  end

  def previous_number_new?
    previous_number = last_spoken

    1 == history.count { |number, _age| number == previous_number }
  end
end
