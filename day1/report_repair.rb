require_relative "report_repair_input"

class ReportRepair
  attr_accessor :multiple, :third_num
  attr_reader :report, :entries

  def initialize(input: nil, entries: 2)
    report = input || EXPENSE_REPORT
    @report = report.map(&:to_i)
    @entries = entries
    @third_num = 0 if @entries == 2
    @multiple = nil
  end

  def self.run(input: nil, entries: 2)
    new(input: input, entries: entries).run
  end


  def run
    two_entries if entries == 2

    three_entries if entries == 3

    multiple
  end


  private

  def three_entries
    sum_three_to_2020(report.clone)
  end

  def sum_three_to_2020(arr)
    return if arr.empty?

    @third_num = arr.pop

    sum_to_2020(arr.clone)

    sum_three_to_2020(arr) if multiple.nil?
  end

  def two_entries
    sum_to_2020(odds)
    unless multiple
      sum_to_2020(evens)
    end
  end

  def odds
    @odds ||= report.select {|num| num.odd? }
  end

  def evens
    @evens ||= report.select {|num| num.even? }
  end

  def sum_to_2020(arr)
    return if arr.empty?

    @current_num = arr.pop

    try_to_sum(arr)

    sum_to_2020(arr) if multiple.nil?
  end

  def try_to_sum(arr)
    arr.each do |num|
      next unless num + @current_num + @third_num == 2020

      @multiple = num * @current_num
      @multiple = @multiple * @third_num if @third_num > 0
    end
  end

end
