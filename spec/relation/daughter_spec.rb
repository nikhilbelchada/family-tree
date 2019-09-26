require 'relation'
require 'relation/child'
require 'relation/daughter'
require 'relation/son'
require 'relation/father'
require 'family_tree'
require 'family'
require 'person'
require 'gender'
require 'utils'
require 'utils/message'
require 'string'


RSpec.describe Relation::Daughter do
  context "search_for" do
    it "should search for daughters of person" do
      family_tree = FamilyTree.new
      family_tree.add("juno", "male")
      family_tree.add("uno", "female")
      family_tree.add("tno", "male")

      family_tree.add_relation_as("juno", "father", "uno")
      family_tree.add_relation_as("juno", "father", "tno")

      juno = family_tree.get_member_by("juno")
      tno = family_tree.get_member_by("tno")
      expect(Relation::Daughter.search_for(juno).count).to eq 1
      expect(Relation::Daughter.search_for(tno).count).to eq 0
    end

    it "should search for all decendent daughters of person" do
      family_tree = FamilyTree.new
      family_tree.add("juno", "male")
      family_tree.add("uno", "female")
      family_tree.add("tno", "male")

      family_tree.add("ano", "female")
      family_tree.add("bno", "male")

      family_tree.add("cno", "male")
      family_tree.add("dno", "female")

      family_tree.add_relation_as("juno", "father", "uno")
      family_tree.add_relation_as("juno", "father", "tno")

      family_tree.add_relation_as("tno", "father", "ano")
      family_tree.add_relation_as("tno", "father", "bno")

      family_tree.add_relation_as("bno", "father", "cno")
      family_tree.add_relation_as("bno", "father", "dno")

      juno = family_tree.get_member_by("juno")
      ano = family_tree.get_member_by("ano")
      cno = family_tree.get_member_by("cno")

      all_daughters = Relation::Daughter.search_for(juno, {all: true})
      expect(all_daughters.count).to eq 3
      expect(all_daughters.collect(&:name)).to eq(["uno", "ano", "dno"])

      all_daughters = Relation::Daughter.search_for(ano, {all: true})
      expect(all_daughters.count).to eq 0

      all_daughters = Relation::Daughter.search_for(cno, {all: true})
      expect(all_daughters.count).to eq 0
    end
  end
end
