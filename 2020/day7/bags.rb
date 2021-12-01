require "pry"
class Bags
  attr_reader :bag_list, :type
  attr_accessor :bags_that_hold_type, :holds_bag, :total_count

  def initialize(path:, type: "shiny gold")
    @type = type
    @bag_list = File.read(path).split("\n").map { |data| ::Bag.new(data) }
    @bags_that_hold_type = {}
    @holds_bag = false
    @total_count = 0
  end

  def self.bags_that_hold_my_bag(path: "./2020/day7/input.txt")
    new(path: path).bags_that_hold_my_bag
  end

  def self.needed_bags(path: "./2020/day7/input.txt")
    new(path: path).needed_bags
  end

  def needed_bags
    count_bags(shiny_bag, 1)
    
    @total_count
  end

  def count_bags(bag, above_count)
    return if bag.nil?

    bag.contains.each do |bag_hash|
      @total_count += bag_hash[:how_many] * above_count
      new_bag = select_bag(bag_hash[:type])
      count_bags(new_bag, above_count * bag_hash[:how_many])
    end
  end

  def shiny_bag
    select_bag(@type)
  end

  def bags_that_hold_my_bag
    count = 0

    bag_list.each do |bag|
      next if bag.type == type
      next if bags_that_hold_type[bag.type]

      if bag.contains_bag?(type)
        bags_that_hold_type[bag.type] = 0
        next
      end

      @holds_bag = false
      check_bag(bag)
      bags_that_hold_type[bag.type] = 0 if @holds_bag
    end

    bags_that_hold_type.keys.count 
  end

  def check_bag(bag)
    return if bag.contains.empty?

    if bag.contains_bag?(type)
      bags_that_hold_type[bag.type] = 0
      @holds_bag = true
      return
    end

    return if bag.contains == []
    bag.contains.each do |bag_hash|
      check_bag(select_bag(bag_hash[:type]))
    end
  end

  def select_bag(bag_type)
    bag_list.select {|b| b.type == bag_type }.first
  end
end

class Bag
  attr_reader :type, :contains
  def initialize(data_str)
    data_arr = data_str.split("contain")
    @type = data_arr[0].gsub("bags","").strip
    @contains = parse_contains(data_arr[1])
  end

  def contains_bag?(bag_type)
    contains.map { |bag| bag[:type] }.include?(bag_type)
  end

  def parse_contains(str)
    return [] unless str.match("no other bags").nil?

    bags = str.gsub(/bags*/,"").gsub(".","").split(",")

    bags.map do |bag_str, hash|
      num = bag_str.strip!.scan(/\d/).first
      type_str = bag_str.gsub(/\d/,"").strip

      { type: type_str, how_many: num.to_i }
    end
  end
end