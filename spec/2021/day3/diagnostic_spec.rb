require './2021/day3/diagnostic'


RSpec.describe Diagnostic do
  test_path = "./spec/2021/day3/input.txt"

  describe "first problem" do
    let(:test) { Diagnostic.new(path: test_path)} 

    describe "run" do
      it "outputs a number" do
        expect(test.run).to be_an(Integer)
      end

      describe "with test input" do
        it "returns 198" do
          expect(test.run).to eq 198
        end
      end

      describe "real input" do
        it "returns 3912944" do
          expect(Diagnostic.run).to eq 3912944
        end
      end
    end

    describe "#gamma" do
      describe "with test input" do
        it "returns '10110'" do
          expect(test.gamma).to eq "10110"
        end
      end
    end

    describe "#epsilon" do
      describe "with test input" do
        it "returns '01001'" do
          expect(test.epsilon).to eq "01001"
        end
      end
    end
  end

  describe "second problem" do
    let(:test_diagnostic) { Diagnostic.new(path: test_path, simple: false)} 

    describe "with test input" do
      it "returns 900" do
        expect(Diagnostic.run(path: test_path, simple: false)).to eq 230
      end
    end

    describe "with real input" do
      it "returns the real answer" do
        expect(Diagnostic.run(simple: false)).to eq 4996233
      end
    end 

    describe "#oxygen_generator" do
      describe "with test input" do
        it "returns 10111" do
          expect(test_diagnostic.oxygen_generator).to eq "10111" 
        end
      end
    end

    describe "#scrub_rating" do
      describe "with test input" do
        it "returns 01010" do
          expect(test_diagnostic.scrub_rating).to eq "01010"
        end
      end
    end
  end
end
