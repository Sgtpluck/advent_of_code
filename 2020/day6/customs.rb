class Customs
  attr_reader :group_list 
  def initialize(path:)
    @group_list = File.read(path).split("\n\n").map{ |data| ::Group.new(data) }
  end

  def self.uniq_yes_count(path: "./2020/day6/input.txt")
    new(path: path).uniq_yes_count
  end

  def self.intersection_yes_count(path: "./2020/day6/input.txt")
    new(path: path).intersection_yes_count
  end

  def intersection_yes_count
    @group_list.sum(&:intersection_yes_count)
  end

  def uniq_yes_count
    @group_list.sum(&:uniq_yes_count)
  end
end

class Group
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def questions_with_yes_answers
    data.scan(/\w/).uniq
  end

  def uniq_yes_count
    questions_with_yes_answers.count
  end

  def intersection_yes_count
    question_list = []
    questions_with_yes_answers.each do |question|
      if data.scan(question).count == group_size
        question_list.push(question)
      end
    end

    question_list.count
  end

  def group_size
    data.split("\n").map(&:strip).count
  end
end