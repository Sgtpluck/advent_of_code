require "pry"
class BoardingPassDecoder
  attr_reader :route_to_airport
  
  def initialize(path:)
    @boarding_pass_list = File.read(path).split("\n").map{ |data| ::BoardingPass.new(data) }
  end

  def self.run(path: "./day5/input.txt")
    new(path: path).run
  end

  def run
   raise "Not implemented yet"
  end
end


class BoardingPass
  def initialize(data)
    @data = data
  end


end