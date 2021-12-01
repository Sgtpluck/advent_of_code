require './2020/day6/customs'

RSpec.describe Customs do
  describe "#uniq_yes_count" do
    it "outputs a number" do
      expect(Customs.uniq_yes_count(path: "./spec/2020/day6/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 11" do
        expect(Customs.uniq_yes_count(path: "./spec/2020/day6/input.txt")).to eq(11)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(Customs.uniq_yes_count).to eq(6259)
      end
    end
  end

  describe "#intersection_yes_count" do
    describe "with test input" do
      it "outputs 6" do
        expect(Customs.intersection_yes_count(path: "./spec/2020/day6/input.txt")).to eq(6)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(Customs.intersection_yes_count).to eq(3178)
      end
    end
  end
end

RSpec.describe Group do
  describe "uniq_yes_count" do
    it "is 3 if there is one person with 3 yeses" do
      expect(Group.new("abc").uniq_yes_count).to eq 3
    end

    it "is 3 if there is three people with 1 yes that are all different" do
      str = "a
      b
      c"
      expect(Group.new(str).uniq_yes_count).to eq 3
    end

    it "is 3 if there is two people person with 1 same yes and 1 different" do
      str = "ab
      ac"
      expect(Group.new(str).uniq_yes_count).to eq 3
    end

    it "is 1 if there are 4 people person with same yes" do
      str = "a
      a
      a
      a"
      expect(Group.new(str).uniq_yes_count).to eq 1
    end
  end
end
