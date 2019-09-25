require 'family'

RSpec.describe Family do
  context "Initialize" do
    it "should initialize childrens" do
      expect(Family.new.childrens).to eq []
    end

    it "should initialize mother to nil" do
      expect(Family.new.mother).to eq nil
    end

    it "should initialize father to nil" do
      expect(Family.new.father).to eq nil
    end
  end
end
