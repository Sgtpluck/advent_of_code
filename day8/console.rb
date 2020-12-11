require "pry"
class Console
  attr_reader :command_list
  attr_accessor :idx_list, :accumulator, :broken_command, :completed

  def initialize(path: "./day8/input.txt")
    @command_list = File.read(path)
      .split("\n")
      .each_with_index
      .map { |data, idx| ::Command.create(*data.split(" "), idx) }
    starting_values
    @broken_command = nil
  end

  def run
    run_program(command_list.first)
  end

  def self.run(path: "./day8/input.txt")
    new(path: path).run
  end

  def starting_values
    @accumulator = 0
    @idx_list = []
    @idx = 0
    @completed = false
  end

  def fix_program
    run
    list_to_check = @idx_list.reverse

    list_to_check.each do |idx|
      starting_values
      last_command = command_list[idx]
      next if last_command.class == Acc

      @broken_command = last_command
      
      new_command = last_command.change_command
      new_command_list = command_list.map do |command|
        command == last_command ? new_command : command
      end

      run_program(new_command_list.first, new_command_list)

      break if @completed
    end
  end

  def run_program(command, running_command_list = command_list)
    # if the index of the command has already been called, we're in the loop. return!
    return if @idx_list.include?(command.idx)
    @idx_list.push(command.idx)

    accumulator_change, idx_change = command.run

    @accumulator += accumulator_change
    @idx += idx_change

    if running_command_list[@idx].nil?
      @completed = true
      return
    end

    run_program(running_command_list[@idx], running_command_list)
  end
end

class Command
  attr_reader :arg, :idx
  def initialize(arg, idx)
    @arg = arg.to_i
    @idx = idx
  end

  def self.create(operation, arg, idx)
    Object.const_get(operation.capitalize).new(arg, idx)
  end
end

class Nop < Command
  def run
    # nop does nothing
    # so accumulator does not go up
    # index goes up by 1
    return [0, 1]
  end

  def change_command
    Jmp.new(arg, idx)
  end
end

class Acc < Command
  def run
    # acc changes accumulator total
    # idx goes up by 1
    [arg, 1]
  end

  def change_command
    self
  end
end

class Jmp < Command
  def run
    # accumulator does not change
    # idx changes by arg
    [0, arg]
  end

  def change_command
    Nop.new(arg, idx)
  end
end
