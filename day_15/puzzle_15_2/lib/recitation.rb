class Recitation
  attr_reader :last_spoken, :turn

  def initialize(numbers)
    @numbers = numbers

    @history = numbers.map.with_index { |number, index| [number, [nil, index]] }.to_h
    @last_spoken = numbers.last
    @turn = numbers.length
  end

  def next_number
    result = last_spoken_for_first_time? ? 0 : age

    @history[result] = @history.key?(result) ? [@history[result].last, @turn] : [nil, @turn]

    @last_spoken = result
    @turn += 1

    result
  end

  private

  def age
    @history[@last_spoken].reduce(:-).abs
  end

  def last_spoken_for_first_time?
    @history[@last_spoken].first.nil?
  end
end
