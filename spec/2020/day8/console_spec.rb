require './2020/day8/console'

RSpec.describe Console do
  describe "#accumulator_total" do
    it "outputs a number" do
      console = Console.new(path: "./spec/2020/day8/input.txt")
      console.run
      expect(console.accumulator).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 5" do
        console = Console.new(path: "./spec/2020/day8/input.txt")
        console.run
        expect(console.accumulator).to eq(5)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        console = Console.new
        console.run
        expect(console.accumulator).to eq(1528)
      end
    end
  end

  describe "fix_program" do 
    describe "with test input" do
      let(:console) { Console.new(path: "./spec/2020/day8/input.txt") }
      before do
        console.fix_program 
      end 

      it "finds the correct command" do
        expect(console.broken_command).to eq(console.command_list[7])
      end

      it "has the correct accumulator" do
        expect(console.accumulator).to eq 8
      end
    end

    describe "with real input" do
      let(:console) { Console.new }
      before do
        console.fix_program 
      end 

      it "finds the correct command" do
        expect(console.broken_command).to eq(console.command_list[363])
      end

      it "has the correct accumulator" do
        expect(console.accumulator).to eq 640
      end
    end
  end
end
