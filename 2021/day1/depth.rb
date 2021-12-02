require "pry"

class Depth
  attr_reader :basic_list, :simple
  attr_accessor :increases

  def initialize(path:, simple:)
    @basic_list = File.read(path).split("\n").map(&:to_i)
    @simple = simple
    @increases = 0
    find_increases
  end

  def self.run(path: "./2021/day1/input.txt", simple: true)
    new(path: path, simple: simple).run
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

  def triples
    @basic_list.each_with_index.map {|depth, idx| [depth, @basic_list[idx+1], @basic_list[idx+2]].compact}
      .select {|triple| triple.count == 3}
  end

  def triples_sum_list
    triples.map(&:sum)
  end

  def depth_list
    return @basic_list if @simple

    triples_sum_list
  end

end