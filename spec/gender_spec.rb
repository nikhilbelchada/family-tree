require 'gender'

RSpec.describe Gender do
  context "is_valid?" do
    it "should return true if male" do
      expect(Gender.is_valid?("male")).to eq true
    end

    it "should return true if female" do
      expect(Gender.is_valid?("female")).to eq true
    end

    it "should return false otherwise" do
      expect(Gender.is_valid?("fmale")).to eq false
    end
  end
end
