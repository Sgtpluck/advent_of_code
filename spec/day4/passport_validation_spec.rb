require './day4/passport_validation'

RSpec.describe PassportValidation do
  describe "run" do
    it "outputs a number" do
      expect(PassportValidation.run(path: "./spec/day4/input.txt")).to be_an(Integer)
    end

    describe "with test input" do
      it "outputs 2" do
        expect(PassportValidation.run(path: "./spec/day4/input.txt")).to eq(2)
      end
    end

    # describe "with real input" do
    #   it "outputs the right number" do
    #     expect(PassportValidation.run).to eq(222)
    #   end
    # end

    describe "with more validation rules" do
      describe "with test input" do
        it "outputs 4" do
          expect(PassportValidation.run(path: "./spec/day4/input2.txt")).to eq(4)
        end
      end

      describe "with real input" do
        it "outputs the right count" do
          expect(PassportValidation.run).to eq(140)
        end
      end
    end
  end 
end

RSpec.describe Byr do
  describe "valid?" do
    it "outpus true for valid input" do
      expect(Byr.new("2002").valid?).to be true
    end

    it "outpus false for invalid input" do
      expect(Byr.new("2003").valid?).to be false
    end
  end 
end

RSpec.describe Hgt do
  describe "valid?" do
    it "outpus true for valid input" do
      expect(Hgt.new("60in").valid?).to be true
      expect(Hgt.new("190cm").valid?).to be true
    end

    it "outpus false for invalid input" do
      expect(Hgt.new("190in").valid?).to be false
      expect(Hgt.new("190").valid?).to be false
    end
  end 
end

RSpec.describe Hgt do
  describe "valid?" do
    it "outpus true for valid input" do
      expect(Hgt.new("60in").valid?).to be true
      expect(Hgt.new("190cm").valid?).to be true
    end

    it "outpus false for invalid input" do
      expect(Hgt.new("190in").valid?).to be false
      expect(Hgt.new("190").valid?).to be false
    end
  end 
end

RSpec.describe Hcl do
  describe "valid?" do
    it "outpus true for valid input" do
      expect(Hcl.new("#123abc").valid?).to be true
    end

    it "outpus false for invalid input" do
      expect(Hcl.new("#123abz").valid?).to be false
      expect(Hcl.new("123abc").valid?).to be false
    end
  end 
end

RSpec.describe Ecl do
  describe "valid?" do
    it "outpus true for valid input" do
      expect(Ecl.new("brn").valid?).to be true
    end

    it "outpus false for invalid input" do
      expect(Ecl.new("wat").valid?).to be false
    end
  end 
end

RSpec.describe Pid do
  describe "valid?" do
    it "outpus true for valid input" do
      expect(Pid.new("000000001").valid?).to be true
    end

    it "outpus false for invalid input" do
      expect(Pid.new("0123456789").valid?).to be false
    end
  end 
end