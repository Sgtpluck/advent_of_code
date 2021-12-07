require "pry"

class Diagnostic
  Input = "./2021/day3/input.txt"

  def initialize(path:, simple: true)
    @simple = simple
    @report = File.read(path).split("\n")
  end

  def self.run(path: Input, simple: true)
    new(path: path, simple: simple).run
  end

  def run
    if @simple
      gamma.to_i(2) * epsilon.to_i(2)
    else
      scrub_rating.to_i(2) * oxygen_generator.to_i(2)
    end
  end

  def transposed_report
    @transposed_report ||= transpose(@report)
  end

  def gamma
    @gamma ||= transposed_report
      .map {|bin| bin.count("0") > bin.length/2 ? "0" : "1"}
      .join 
  end

  def epsilon
    gamma.split("").map{|d| d == "0" ? "1" : "0"}.join
  end

  def oxygen_generator
    get_oxygen_rating(@report, 0)
  end

  def scrub_rating 
    get_scrub_rating(@report, 0)
  end

  private

  def get_oxygen_rating(list, idx)
    bin = transpose(list)[idx]
    most_common = bin.count("1") >= bin.count("0") ? "1" : "0"
    
    remaining = list.select {|bin| bin[idx] == most_common }

    return remaining[0] if remaining.count == 1
    get_oxygen_rating(remaining, idx + 1)
  end

  def get_scrub_rating(list, idx)
    bin = transpose(list)[idx]
    less_common = bin.count("1") >= bin.count("0") ? "0" : "1"
    
    remaining = list.select {|bin| bin[idx] == less_common }

    return remaining[0] if remaining.count == 1
    get_scrub_rating(remaining, idx + 1)
  end

  def transpose(list)
    list.map {|str| str.split("")}.transpose.map {|arr| arr.join}
  end

end
