require './day7/Bags'

RSpec.describe Bags do
  describe "#bags_that_hold_my_bag" do
    it "outputs a number" do
      expect(Bags.bags_that_hold_my_bag(path: "./spec/day7/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 4" do
        expect(Bags.bags_that_hold_my_bag(path: "./spec/day7/input.txt")).to eq(4)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(Bags.bags_that_hold_my_bag).to eq(261)
      end
    end
  end

  describe "#needed_bags" do
    it "outputs a number" do
      expect(Bags.needed_bags(path: "./spec/day7/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 32" do
        expect(Bags.needed_bags(path: "./spec/day7/input.txt")).to eq(32)
      end
    end

    describe "with other test input" do
      it "outputs 4" do
        expect(Bags.needed_bags(path: "./spec/day7/input1.txt")).to eq(126)
      end
    end

    describe "with real input" do
      it "outputs the right number" do
        expect(Bags.needed_bags).to eq(3765)
      end
    end
  end
end

RSpec.describe Bag do
  describe "#initialize" do
    let(:input) { "light red bags contain 1 bright white bag, 2 muted yellow bags." }
    it "has a type" do
      expect(Bag.new(input).type).to eq "light red"
    end  

    it "has a contains hash" do
      contains = [ 
        { type: "bright white", how_many: 1},
        { type: "muted yellow", how_many: 2 }
      ]
      expect(Bag.new(input).contains).to eq contains
    end

    describe "it does not contain any other bags" do
      it "has an empty contains hash" do
        input = "faded blue bags contain no other bags."
        expect(Bag.new(input).contains).to eq([])
      end
    end
  end
end
