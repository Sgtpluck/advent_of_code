require './2021/day1/depth'

RSpec.describe Depth do

  describe "run" do
    it "outputs a number" do
      expect(Depth.run(path: "./spec/2021/day1/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "returns 7" do
        expect(Depth.run(path: "./spec/2021/day1/input.txt")).to eq 7
      end
    end

    describe "with real input" do
      it "returns the real answer" do
        expect(Depth.run).to eq 1616
      end
    end 
  end
end