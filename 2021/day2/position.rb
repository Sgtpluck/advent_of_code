require "pry"

class Position
  Input = "./2021/day2/input.txt"

  def initialize(path:)
    @depth_array = []
    @distance_array = []
    File.read(path).split("\n").each do |command|
      command.match?(/forward/) ? @distance_array.push(command) : @depth_array.push(command)
    end
  end

  def self.run(path: Input)
    new(path: path).run
  end

  def run
    depth * distance
  end

  def depth
    @depth_array.map {|command| command.gsub("up ", "-").gsub("down ", "").to_i}.sum
  end

  def distance
    @distance_array.map {|command| command.gsub("forward ", "").to_i}.sum
  end
end