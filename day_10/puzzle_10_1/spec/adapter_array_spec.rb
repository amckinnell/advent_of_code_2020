RSpec.describe AdapterArray do
  describe "#eligible_adapters" do
    example do
      array_adapter = AdapterArray.new(<<~DATA)
        1
      DATA

      result = array_adapter.eligible_adapters(0, [1])

      expect(result).to contain_exactly(1)
    end

    example do
      array_adapter = AdapterArray.new(<<~DATA)
        4
      DATA

      result = array_adapter.eligible_adapters(0, [4])

      expect(result).to be_empty
    end

    example do
      array_adapter = AdapterArray.new(<<~DATA)
        1
        4
        2
        3
      DATA

      result = array_adapter.eligible_adapters(0, [1, 2, 3, 4])

      expect(result).to contain_exactly(1, 2, 3)
    end
  end

  describe "#longest_adapter_sequence" do
    it "single adapter" do
      array_adapter = AdapterArray.new(<<~DATA)
        1
      DATA

      result = array_adapter.longest_adapter_sequence

      expect(result).to eq([1])
    end

    it "multiple adapters" do
      array_adapter = AdapterArray.new(<<~DATA)
        1
        2
        3
        6
      DATA

      result = array_adapter.longest_adapter_sequence

      expect(result).to eq([1, 2, 3, 6])
    end

    it "no possible adapter sequence" do
      array_adapter = AdapterArray.new(<<~DATA)
        1
        2
        7
      DATA

      expect { array_adapter.longest_adapter_sequence }
        .to raise_error(RuntimeError, "No complete adapter sequence found")
    end

    it "example from Day 10" do
      array_adapter = AdapterArray.new(<<~DATA)
        16
        10
        15
        5
        1
        11
        7
        19
        6
        12
        4
      DATA

      result = array_adapter.longest_adapter_sequence

      expect(result).to eq([1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19])
    end
  end
end
