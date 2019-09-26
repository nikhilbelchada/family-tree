require 'command.rb'
require 'command/add.rb'

RSpec.describe Command::Add do
  context "extract_options" do
    it "should extract name" do
      options = Command::Add.extract_options("add juno")

      expect(options[:person]).to eq "juno"
    end

    it "should set name to nil if not provided" do
      options = Command::Add.extract_options("add ")

      expect(options[:person]).to eq nil
      expect(options[:gender]).to eq nil
    end

    it "should extract gender" do
      options = Command::Add.extract_options("add juno male")

      expect(options[:gender]).to eq "male"
    end

    it "should extract name and gender" do
      options = Command::Add.extract_options("add juno male")

      expect(options[:person]).to eq "juno"
      expect(options[:gender]).to eq "male"
    end

    it "should trim white spaces" do
      options = Command::Add.extract_options("add   juno    male")

      expect(options[:person]).to eq "juno"
      expect(options[:gender]).to eq "male"
    end
  end
end

