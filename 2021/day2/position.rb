require "pry"

class Position
  Input = "./2021/day2/input.txt"

  def initialize(path:, simple: true)
    @simple = simple
    @commands = File.read(path).split("\n").map do |command|
      name, amount = command.split(" ")
      Object.const_get(name.capitalize).new(amount: amount.to_i)
    end
  end

  def self.run(path: Input, simple: true)
    new(path: path, simple: simple).run
  end

  def run
    depth * distance
  end

  def depth
    if @simple
      simple_depth
    else
      complex_depth 
    end
  end

  def complex_depth
    deep = 0
    aim = 0
    @commands.each do |command|
      if command.is_forward?
        deep += command.amount * aim 
      else
        aim += command.amount
      end
    end
    deep
  end

  def distance
    @commands
      .select {|command| command.is_forward?}
      .sum(&:amount)
  end

  def simple_depth
    @commands
      .reject {|command| command.is_forward?}
      .sum(&:amount)
  end


end

class Cmd
  attr_accessor :amount

  def initialize(amount:)
    @amount = amount
  end

  def is_forward?
    self.class == Forward
  end
end

class Down < Cmd
end

class Up < Cmd
  def initialize(amount:)
    @amount = -amount
  end
end

class Forward < Cmd
end
