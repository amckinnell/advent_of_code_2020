RSpec.describe SeatingSystem do
  describe "simple cases" do
    it "minimal with empty seat" do
      seating_system = SeatingSystem.new(<<~DATA)
        L.
        LL
      DATA

      seating_system.next_round

      expect(seating_system.display).to eq(<<~EXPECTED.chomp)
        #.
        ##
      EXPECTED

      seating_system.next_round

      expect(seating_system.display).to eq(<<~EXPECTED.chomp)
        #.
        ##
      EXPECTED
    end

    it "minimal with no empty seat" do
      seating_system = SeatingSystem.new(<<~DATA)
        LL
        LL
      DATA

      seating_system.next_round

      expect(seating_system.display).to eq(<<~EXPECTED.chomp)
        ##
        ##
      EXPECTED

      seating_system.next_round

      expect(seating_system.display).to eq(<<~EXPECTED.chomp)
        ##
        ##
      EXPECTED
    end

    it "minimal with seats becoming empty" do
      seating_system = SeatingSystem.new(<<~DATA)
        LL.
        LLL
        LLL
      DATA

      seating_system.next_round

      expect(seating_system.display).to eq(<<~EXPECTED.chomp)
        ##.
        ###
        ###
      EXPECTED

      seating_system.next_round

      expect(seating_system.display).to eq(<<~EXPECTED.chomp)
        #L.
        LLL
        #L#
      EXPECTED
    end
  end

  it "passes the example from the problem statement" do
    seating_system = SeatingSystem.new(<<~DATA)
      L.LL.LL.LL
      LLLLLLL.LL
      L.L.L..L..
      LLLL.LL.LL
      L.LL.LL.LL
      L.LLLLL.LL
      ..L.L.....
      LLLLLLLLLL
      L.LLLLLL.L
      L.LLLLL.LL
    DATA

    seating_system.next_round

    expect(seating_system.display).to eq(<<~EXPECTED.chomp)
      #.##.##.##
      #######.##
      #.#.#..#..
      ####.##.##
      #.##.##.##
      #.#####.##
      ..#.#.....
      ##########
      #.######.#
      #.#####.##
    EXPECTED

    seating_system.next_round

    expect(seating_system.display).to eq(<<~EXPECTED.chomp)
      #.LL.L#.##
      #LLLLLL.L#
      L.L.L..L..
      #LLL.LL.L#
      #.LL.LL.LL
      #.LLLL#.##
      ..L.L.....
      #LLLLLLLL#
      #.LLLLLL.L
      #.#LLLL.##
    EXPECTED
  end
end
