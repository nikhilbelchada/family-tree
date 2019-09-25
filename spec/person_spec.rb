require 'family'

RSpec.describe Person do
  context "Initialize" do
    let(:male) { male = "male" }
    let(:female) { female = "female" }
    let(:name) { name = "Juno" }

    it "should initialize name" do
      person = Person.new(name, male)

      expect(person.name).to eq name
    end

    it "should initialize gender" do
      person = Person.new(name, male)

      expect(person.gender).to eq male
    end

    it "should not allow for invalid gender" do
      expect { Person.new(name, "test") }.to raise_error "Invalid Gender"
    end
  end
end
