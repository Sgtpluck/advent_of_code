require './2020/day3/sled_ride'

RSpec.describe SledRide do
  describe "run" do
    it "outputs a number" do
      expect(SledRide.run(path: "./spec/2020/day3/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 2" do
        expect(SledRide.run(path: "./spec/2020/day3/input.txt")).to eq(7)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(SledRide.run).to eq(254)
      end
    end

    describe "#calculate_multiple_slopes" do
      describe "with test inut" do
        it "returns 336" do
          expect(SledRide.new(path: "./spec/2020/day3/input.txt").calculate_multiple_slopes)
            .to eq(336)
        end
      end

      describe "with real input" do
        it "returns 336" do
          expect(SledRide.new.calculate_multiple_slopes)
            .to eq(1666768320)
        end
      end
    
    end
  end 
end