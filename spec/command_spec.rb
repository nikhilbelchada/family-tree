require 'command.rb'
require 'command/add.rb'
require 'command/relation.rb'
require 'command/search.rb'

require 'relation.rb'
require 'relation/father.rb'
require 'relation/mother.rb'
require 'relation/child.rb'
require 'relation/sibling.rb'

RSpec.describe Command do
  describe "is_valid?" do
    context "add" do
      it "should return true if valid" do
        expect(Command.is_valid?("add juno male")).to eq true
      end

      it "should return false if not valid" do
        expect(Command.is_valid?("addjuno male")).to eq false
      end
    end

    context "relation" do
      it "should return true if valid" do
        expect(Command.is_valid?("juno as father of uno")).to eq true
        expect(Command.is_valid?("juno as mother of uno")).to eq true
        expect(Command.is_valid?("juno as daughter of uno")).to eq true
        expect(Command.is_valid?("juno as son of uno")).to eq true
        expect(Command.is_valid?("juno as sister of uno")).to eq true
        expect(Command.is_valid?("juno as brother of uno")).to eq true
      end

      it "should return false if not valid" do
        expect(Command.is_valid?("juno as dono of uno")).to eq false
      end
    end

    describe "get_command_from" do
      context "add" do
        it "should get command class" do
          expect(Command.get_command_from("add juno male")).to eq Command::Add
          expect(Command.get_command_from("add ")).to eq Command::Add
        end

        it "should get nil if invalid text" do
          expect(Command.get_command_from("add")).to eq nil
        end
      end

      context "relation" do
        it "should get command class" do
          expect(Command.get_command_from("juno as father of uno")).to eq Command::Relation
          expect(Command.get_command_from("juno as mother of uno")).to eq Command::Relation
          expect(Command.get_command_from("juno as son of uno")).to eq Command::Relation
          expect(Command.get_command_from("juno as daughter of uno")).to eq Command::Relation
          expect(Command.get_command_from("juno as sister of uno")).to eq Command::Relation
          expect(Command.get_command_from("juno as brother of uno")).to eq Command::Relation
        end

        it "should get nil if invalid text" do
          expect(Command.get_command_from("juno father of uno")).to eq nil
        end
      end

      context "search" do
        it "should get command class" do
          expect(Command.get_command_from("get all daughters of juno")).to eq Command::Search
          expect(Command.get_command_from("get siblings of juno")).to eq Command::Search
          expect(Command.get_command_from("get daughters of juno")).to eq Command::Search
        end

        it "should get nil if invalid text" do
          expect(Command.get_command_from("all daughter of juno")).to eq nil
        end
      end
    end
  end
end
