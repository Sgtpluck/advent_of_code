require './day5/boarding_pass_decoder'

RSpec.describe BoardingPassDecoder do
  describe "run" do
    it "outputs a number" do
      expect(BoardingPassDecoder.run(path: "./spec/day5/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 2" do
        expect(BoardingPassDecoder.run(path: "./spec/day5/input.txt")).to eq(820)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(BoardingPassDecoder.run).to eq(861)
      end
    end
  end

  describe "#missing_seat_id" do
    it "returns the missing seat id" do
      expect(BoardingPassDecoder.new.missing_seat_id).to eq(633)
    end
  end
end

RSpec.describe BoardingPass do
  let(:decoder) { BoardingPassDecoder.new(path: "./spec/day5/input.txt") }
  let(:list) { decoder.boarding_pass_list }

  describe "#row" do
    it "returns 44 when it should be 44" do
      expect(list[0].row).to eq 44
    end

    it "returns 70 when it should be 70" do
      expect(list[1].row).to eq 70
    end

    it "returns 102 when it should be 102" do
      expect(list[3].row).to eq 102
    end

    it "returns 14 when it should be 14" do
      expect(list[2].row).to eq 14
    end
  end

  describe "#column" do
    it "returns 5 when it should be 5" do
      expect(list[0].column).to eq 5
    end

    it "returns 7 when it should be 7" do
      expect(list[1].column).to eq 7
    end

    it "returns 7 when it should be 7" do
      expect(list[2].column).to eq 7
    end

    it "returns 4 when it should be 4" do
      expect(list[3].column).to eq 4
    end
  end


end
