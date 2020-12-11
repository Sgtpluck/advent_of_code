class Console
  def initialize(path: "./day8/input.txt")
    @command_list = File.read(path).split("\n").map{ |data| ::Command.new(data) }
  end

  def self.run(path: "./day8/input.txt")
    new(path: path).run
  end

  def run
    boarding_pass_list.collect(&:id).max
  end
end

def Command
end
