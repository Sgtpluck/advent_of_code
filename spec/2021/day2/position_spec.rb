require './2021/day2/position'

RSpec.describe Position do
  test_path = "./spec/2021/day2/input.txt"

  describe "first problem" do
    let(:test_position) { Position.new(path: test_path)} 

    describe "run" do
      it "outputs a number" do
        expect(test_position.run).to be_an(Integer)
      end

      describe "with test input" do
        it "returns 150" do
          expect(test_position.run).to eq 150
        end
      end

      describe "real input" do
        it "returns 1250395" do
          expect(Position.run).to eq 1250395
        end
      end
    end

    describe "#depth" do
      describe "with test input" do
        it "returns 10" do
          expect(test_position.depth).to eq 10
        end
      end
    end

    describe "distance" do
      describe "with test input" do
        it "returns 15" do
          expect(test_position.distance).to eq 15
        end
      end
    end
  end

  describe "second problem" do
    let(:test_position) { Position.new(path: test_path, simple: false)} 

    describe "with test input" do
      it "returns 900" do
        expect(Position.run(path: test_path, simple: false)).to eq 900
      end
    end

    describe "with real input" do
      it "returns the real answer" do
        expect(Position.run(simple: false)).to eq 1451210346
      end
    end 

    describe "#depth" do
      describe "with test input" do
        it "returns 10" do
          expect(test_position.depth).to eq 60
        end
      end
    end

    describe "distance" do
      describe "with test input" do
        it "returns 15" do
          expect(test_position.distance).to eq 15
        end
      end
    end
  end
end
