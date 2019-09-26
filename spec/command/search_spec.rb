require 'command.rb'
require 'command/search.rb'

require 'relation'
require 'relation/child.rb'
require 'relation/father.rb'
require 'relation/mother.rb'
require 'relation/sibling.rb'

RSpec.describe Command::Search do
  describe "extract_options" do
    it "should extract symbol" do
      options = Command::Search.extract_options("get daughter of juno")

      expect(options[:symbol]).to eq "daughter"
    end

    it "should extract person name" do
      options = Command::Search.extract_options("get daughter of juno")

      expect(options[:person_name]).to eq "juno"
    end

    it "should extract set all to true" do
      options = Command::Search.extract_options("get all daughter of juno")

      expect(options[:all]).to eq true
    end

    it "should extract set all to false" do
      options = Command::Search.extract_options("get daughter of juno")

      expect(options[:all]).to eq false
    end
  end
end
