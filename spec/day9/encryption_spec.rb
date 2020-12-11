require './day9/encryption'

RSpec.describe Encryption do
  describe "#run" do
    it "outputs a number" do
      expect(Encryption.run(path: "./spec/day9/input.txt", preamble: 5)).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 5" do
      expect(Encryption.run(path: "./spec/day9/input.txt", preamble: 5)).to eq(127)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(Encryption.run).to eq(393911906)
      end
    end
  end

  describe "#find_weakness" do
    describe "with test input" do
      let(:encryption) { Encryption.new(path: "./spec/day9/input.txt", preamble: 5) }
      before do
        encryption.run
      end

      it "outputs a number" do
        expect(encryption.find_weakness).to be_an(Integer)
      end

      it "outputs 5" do
        expect(encryption.find_weakness).to eq(62)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        encryption = Encryption.new
        encryption.run
        expect(encryption.find_weakness).to eq(59341885)
      end
    end
  end
end
