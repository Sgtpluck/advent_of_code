require "pry"
class Encryption
  attr_reader :stream, :preamble
  attr_accessor :first_wrong_number, :wrong_number_idx

  def initialize(path: "./day9/input.txt", preamble: 25)
    @stream = File.read(path).split("\n").map(&:to_i)
    @preamble = preamble
  end

  def self.run(path: "./day9/input.txt", preamble: 25)
    new(path: path, preamble: preamble).run
  end

  def run
    data.each_with_index do |number, idx|
      pairs = stream[idx..(preamble - 1) + idx].combination(2).select {|x,y| x+y == number }
      pairs = pairs.reject {|x,y| x == y }

      if pairs.empty?
        @first_wrong_number = number
        @wrong_number_idx = idx + preamble
        break
      end
    end

    @first_wrong_number
  end

  def find_weakness
    summed_list = []
    sum_list.each_with_index do |number, num_idx|
      new_list = sum_list[num_idx + 1..-1]
      summed_list = sum(new_list, number, [])
      summed_list.push(number)
      
      break unless summed_list.length == 1
    end

    summed_list.max + summed_list.min
  end

  def sum(list, current_sum, summed_list)    
    head = list[0]
    current_sum += head
    if current_sum == @first_wrong_number
      summed_list.push(head)
      summed_list
    elsif current_sum > @first_wrong_number
      []
    else
      sum(list[1..-1], current_sum, summed_list.push(head))
    end
  end

  def sum_list
    # we want all the numbers before the wrong number, in reverse order
    @sum_list ||= stream[0..wrong_number_idx - 1].reverse
  end

  def data
    @data ||= stream[preamble..-1]
  end
end
