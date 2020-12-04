namespace "aoc" do
  desc "Create a puzzle directory for the Advent of Code"
  task :puzzle, [:day_number, :puzzle_number] do |t, args|
    day_dir = "day_%02d" % args.day_number
    puzzle_dir = "puzzle_%02d_%d" % [args.day_number, args.puzzle_number]

    FileUtils.mkdir_p "#{day_dir}/#{puzzle_dir}/"
    FileUtils.cp_r "puzzle_template/.", "#{day_dir}/#{puzzle_dir}/"
  end
end
