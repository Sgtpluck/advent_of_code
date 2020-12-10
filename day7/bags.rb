require "pry"
class Bags
  attr_reader :rules_list 

  def initialize(path:)
    @rules_list = File.read(path).split("\n").map { |data| ::Bag.new(data) }
  end

  def self.run(path: "./day7/input.txt")
    new(path: path).run
  end

  def run
    raise "Not yet implemented"
  end

end

class Bag
  attr_reader :data
  def initialize(data)
    @data = data
  end
end