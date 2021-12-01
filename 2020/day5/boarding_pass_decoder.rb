class BoardingPassDecoder
  attr_reader :boarding_pass_list
  attr_accessor :full_row, :missing_seat

  def initialize(path: "./2020/day5/input.txt")
    @boarding_pass_list = File.read(path).split("\n").map{ |data| ::BoardingPass.new(data) }
  end

  def self.run(path: "./2020/day5/input.txt")
    new(path: path).run
  end

  def run
    boarding_pass_list.collect(&:id).max
  end

  def missing_seat_id
    # yuck
    set_full_row
    missing_seat.id + 1
  end

  def set_full_row
    row_numbers = boarding_pass_list.map(&:row).uniq.sort.drop(1)
    row_numbers.delete(row_numbers.size - 1)

    row_numbers.each do |row_number|
      @full_row = boarding_pass_list.select {|pass| pass.row == row_number }

      break if @full_row.count != 8
    end
  end

  def missing_seat
    @missing_seat ||= begin
      seat = nil
      @full_row.each_with_index do |pass, idx|
        seat = pass if pass.column != idx
      end
      seat
    end
  end
end


class BoardingPass
  attr_reader :row_data, :column_data
  def initialize(data)
    @row_data = data[0..6].scan(/\w/)
    @column_data = data[7..-1].scan(/\w/)
  end

  def row
    @row ||= begin
        final_row = row_data.each_with_object({front: 1, back: 128}) do |row, hash|
        front, back = determine_row(hash[:front], hash[:back], row)

        hash[:front] = front
        hash[:back] = back
      end

      final_row[:front] - 1
    end
  end

  def column
    @column ||= begin
        final_column = column_data.each_with_object({front: 1, back: 8}) do |row, hash|
        front, back = determine_row(hash[:front], hash[:back], row)

        hash[:front] = front
        hash[:back] = back
      end

      final_column[:front] - 1
    end
  end

  def id
    (row * 8) + column
  end

  private

 def determine_row(front, back, letter)
  halfway = (front + back + 1)/2

  if letter == "F" || letter == "L"
    [front, halfway - 1]
  elsif letter == "B" || letter == "R"
    [halfway, back]
  end
 end
end
