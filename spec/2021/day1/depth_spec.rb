require './2021/day1/depth'

RSpec.describe Depth do
  test_path = "./spec/2021/day1/input.txt"
  
  describe "run" do
    it "outputs a number" do
      expect(Depth.run(path: test_path)).to be_an(Integer)
    end

    describe "simple method" do
      describe "with test input" do
        it "returns 7" do
          expect(Depth.run(path: test_path)).to eq 7
        end
      end

      describe "with real input" do
        it "returns the real answer" do
          expect(Depth.run).to eq 1616
        end
      end 
    end

    describe "complex method" do
      describe "with test input" do
        it "returns 5" do
          expect(Depth.run(path: test_path, simple: false)).to eq 5
        end
      end

      describe "with real input" do
        it "returns the real answer" do
          expect(Depth.run(simple: false)).to eq 1645
        end
      end 
    end
  end

  describe "triples" do
    describe "with test input" do
      let(:depth) { Depth.new(path: test_path, simple: false) }

      it "returns the correct triples" do
        triples = [[199,200,208], [200,208,210], [208,210,200], [210,200,207], [200,207,240], [207,240,269], [240,269,260], [269,260,263]]

        expect(depth.triples).to eq triples
      end
    end
  end

  describe "triples_sum_list" do
    let(:depth) { Depth.new(path: test_path, simple: false) }
    it "returns an array of the sums of the triples correctly" do
      sums = [607,618,618,617,647,716,769,792]

      expect(depth.triples_sum_list).to eq sums
    end
  end
end
