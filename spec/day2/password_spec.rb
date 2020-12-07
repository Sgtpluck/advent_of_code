require './day2/password'

RSpec.describe Password do
  

  describe "run" do
    it "outputs a number" do
      expect(Password.run(path: "./spec/day2/input.txt")).to be_an(Integer)
    end

    describe "with wrong rules" do
      describe "with test input" do
        it "outputs 2" do
          expect(Password.run(path: "./spec/day2/input.txt")).to eq(2)
        end
      end

      describe "with real input" do
        it "outputs the right number" do
          expect(Password.run).to eq(666)
        end
      end
    end
    
    describe "with correct rules" do
      describe "with test input" do
        it "outputs 1" do
          expect(Password.run(path: "./spec/day2/input.txt", rules: true)).to eq(1)
        end
      end

      describe "with real input" do
        it "outputs the right number" do
          expect(Password.run(rules: true)).to eq(670)
        end
      end
    end
  end


end