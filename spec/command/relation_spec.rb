require 'command.rb'
require 'command/relation.rb'

require 'relation'
require 'relation/child.rb'
require 'relation/father.rb'
require 'relation/mother.rb'
require 'relation/sibling.rb'

RSpec.describe Command::Relation do
  context "extract_options" do
    it "should extract first person" do
      options = Command::Relation.extract_options("juno as father of uno")

      expect(options[:first_person]).to eq "juno"
    end

    it "should extract second person" do
      options = Command::Relation.extract_options("juno as father of uno")

      expect(options[:second_person]).to eq "uno"
    end

    it "should extract symbol" do
      options = Command::Relation.extract_options("juno as father of uno")

      expect(options[:symbol]).to eq "father"
    end
  end
end
