require './day1/report_repair'

RSpec.describe ReportRepair do
  INPUT = %w[
    1721
    979
    366
    299
    675
    1456
  ]

  describe "run" do
    it "outputs a number" do
      expect(ReportRepair.run).to be_an(Integer)
    end

    describe "finding the multiple of two inputs" do

      it "returns 514579" do
        expect(ReportRepair.run(input: INPUT)).to eq(514579)
      end

      it "returns 73371" do
        expect(ReportRepair.run).to eq(73371)
      end
    end

    describe "finding the multiple of three inputs" do

      it "returns 241861950" do
        expect(ReportRepair.run(input: INPUT, entries: 3)).to eq(241861950)
      end

      it "returns 127642310" do
        expect(ReportRepair.run(entries: 3)).to eq(127642310)
      end
    end
  end


end