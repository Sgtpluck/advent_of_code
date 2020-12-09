class SledRide
  attr_reader :route_to_airport

  def initialize(path: "./day3/input.txt")
    @route_to_airport = File.read(path).split("\n")
  end

  def self.run(path: "./day3/input.txt")
    new(path: path).run
  end

  def run(rise: 1, run: 3)
    tree_count = 0
    spot = 0

    route_to_airport.each_with_index do |tree_line, idx|
      next if rise == 2 && idx.odd?
      tree_count += 1 if tree_line[spot] == "#"

      spot += run
      spot = spot - line_length if spot > line_length - 1
    end
    tree_count
  end

  def calculate_multiple_slopes
    slopes.map {|slope| run(rise: slope[:rise], run:slope[:run]) }.reduce(&:*)
  end

  def slopes
    [
      {
        rise: 1,
        run: 1
      },
      {
        rise: 1,
        run: 3
      },
      {
        rise: 1,
        run: 5
      },
      {
        rise: 1,
        run: 7
      },
      {
        rise: 2,
        run: 1
      }
    ]
  end

  def line_length
    @line_length ||= route_to_airport.first.length
  end
end
