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


RSpec.describe Relation::Sibling do
  context "search_for" do
    it "should search for siblings of person" do
      family_tree = FamilyTree.new
      family_tree.add("juno", "male")
      family_tree.add("uno", "female")
      family_tree.add("tno", "male")

      family_tree.add_relation_as("juno", "father", "uno")
      family_tree.add_relation_as("juno", "father", "tno")

      uno = family_tree.get_member_by("uno")
      expect(Relation::Sibling.search_for(uno).count).to eq 2
    end
  end
end
