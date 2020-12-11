require './day8/console_code'

RSpec.describe ConsoleCode do
  describe "#accumulator_total do
    it "outputs a number" do
      expect(ConsoleCode.accumulator_total(path: "./spec/day8/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 5" do
        expect(ConsoleCode.accumulator_total(path: "./spec/day8/input.txt")).to eq(5)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(ConsoleCode.accumulator_total).to eq(261)
      end
    end
  end
 end
end

RSpec.describe Command do
end
