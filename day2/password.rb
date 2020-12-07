require "pry"
class Password
  attr_reader :password_validation_list, :rules
  attr_accessor :valid_count

  def initialize(path:, rules:)
    @password_validation_list = File.read(path).split("\n")
    @rules = rules
    @valid_count = 0
  end

  def self.run(path: "./day2/input.txt", rules: false)
    new(path: path, rules: rules).run
  end

  def run
    password_validation_list.each do |rule|
      parts = rule.tr(":", "").split(" ")
      determine_count(parts)
    end


    valid_count
  end

  def right_rules(parts)
    position1, position2 = parts[0].split("-").map(&:to_i).map {|num| num -= 1 }
    letter_count = 0

    return if parts[2].length < position2 + 1

    letter_one = parts[2][position1]
    letter_two = parts[2][position2]

    return if letter_one == letter_two

    if letter_one == parts[1] || letter_two == parts[1]
      @valid_count += 1
    end
  end

  def determine_count(parts)
    if rules
      right_rules(parts)
    else
      letter_count = parts[2].scan(parts[1]).count
      @valid_count += 1 if Range.new(*parts[0].split("-").map(&:to_i)) === letter_count
    end
  end
end