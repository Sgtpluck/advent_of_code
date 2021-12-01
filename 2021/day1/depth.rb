require "pry"

class Depth
  attr_reader :depth_list
  attr_accessor :increases

  def initialize(path:)
    @depth_list = File.read(path).split("\n").map(&:to_i)
    @increases = 0
    find_increases
  end

  def self.run(path: "./2021/day1/input.txt")
    new(path: path).run
  end

  def run
    @increases
  end

  def find_increases
    depth_list.each_with_index do |depth, idx|
      next if idx == 0
      
      @increases = @increases + 1 if depth > depth_list[idx-1]
    end
  end

end