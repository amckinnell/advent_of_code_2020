class FoundAdaptorSequence < RuntimeError
  attr_reader :adapter_sequence

  def initialize(adapter_sequence)
    @adapter_sequence = adapter_sequence

    super()
  end
end
