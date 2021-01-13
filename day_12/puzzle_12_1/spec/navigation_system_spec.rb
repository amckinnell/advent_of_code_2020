RSpec.describe NavigationSystem do
  describe "simple cases" do
    it "north" do
      navigation_system = NavigationSystem.new(<<~DATA)
        N3
      DATA

      expect(navigation_system).to have_attributes(
        facing: :east,
        position: [0, 3],
        manhattan_distance: 3
      )
    end

    it "south" do
      navigation_system = NavigationSystem.new(<<~DATA)
        S12
      DATA

      expect(navigation_system).to have_attributes(
        facing: :east,
        position: [0, -12],
        manhattan_distance: 12
      )
    end

    it "east" do
      navigation_system = NavigationSystem.new(<<~DATA)
        E1
      DATA

      expect(navigation_system).to have_attributes(
        facing: :east,
        position: [1, 0],
        manhattan_distance: 1
      )
    end

    it "west" do
      navigation_system = NavigationSystem.new(<<~DATA)
        W3
      DATA

      expect(navigation_system).to have_attributes(
        facing: :east,
        position: [-3, 0],
        manhattan_distance: 3
      )
    end

    it "left" do
      navigation_system = NavigationSystem.new(<<~DATA)
        L180
      DATA

      expect(navigation_system).to have_attributes(
        facing: :west,
        position: [0, 0],
        manhattan_distance: 0
      )
    end

    it "right" do
      navigation_system = NavigationSystem.new(<<~DATA)
        R90
      DATA

      expect(navigation_system).to have_attributes(
        facing: :south,
        position: [0, 0],
        manhattan_distance: 0
      )
    end

    it "forward" do
      navigation_system = NavigationSystem.new(<<~DATA)
        F2
      DATA

      expect(navigation_system).to have_attributes(
        facing: :east,
        position: [2, 0],
        manhattan_distance: 2
      )
    end
  end

  it "works" do
    navigation_system = NavigationSystem.new(<<~DATA)
      F10
      N3
      F7
      R90
      F11
    DATA

    expect(navigation_system).to have_attributes(
      facing: :south,
      position: [17, -8],
      manhattan_distance: 25
    )
  end
end
