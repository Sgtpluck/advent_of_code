require './day5/boarding_pass_decoder'

RSpec.describe BoardingPassDecoder do
  describe "run" do
    it "outputs a number" do
      expect(BoardingPassDecoder.run(path: "./spec/day5/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 2" do
        expect(BoardingPassDecoder.run(path: "./spec/day5/input.txt")).to eq(567)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(BoardingPassDecoder.run).to eq(254)
      end
    end
  end 
end