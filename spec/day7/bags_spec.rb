require './day7/Bags'

RSpec.describe Bags do
  describe "#run" do
    it "outputs a number" do
      expect(Bags.run(path: "./spec/day7/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 4" do
        expect(Bags.run(path: "./spec/day7/input.txt")).to eq(4)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(Bags.run).to eq(6259)
      end
    end
  end
end

RSpec.describe Bag do
end
