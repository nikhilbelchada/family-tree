require 'family_tree'
require 'person'
require 'gender'
require 'family'

require 'relation'
require 'relation/father'
require 'relation/mother'
require 'relation/child'
require 'relation/daughter'
require 'relation/son'
require 'relation/sibling'
require 'relation/brother'
require 'relation/sister'

require 'utils.rb'
require 'utils/message.rb'
require 'string.rb'

RSpec.describe FamilyTree do
  context "Initialize" do
    it "should initialize members" do
      expect(FamilyTree.new.members).to eq []
    end

    it "should initialize family" do
      expect(FamilyTree.new.family.class).to eq Family
    end
  end

  context "add member" do
    let(:juno) { juno = "Juno" }
    let(:uno) { uno = "Uno" }
    let(:male) { uno = "male" }

    it "should add member" do
      family_tree = FamilyTree.new
      family_tree.add(juno, male)

      expect(family_tree.members.count).to eq 1
    end

    it "should add multiple members" do
      family_tree = FamilyTree.new
      family_tree.add(juno, male)
      family_tree.add(uno, male)

      expect(family_tree.members.count).to eq 2
    end

    it "should add member to FamilyTree" do
      family_tree = FamilyTree.new
      family_tree.add(juno, male)

      expect(family_tree.members.count).to eq 1
    end

    it "should add member as person" do
      family_tree = FamilyTree.new
      family_tree.add(juno, male)

      expect(family_tree.members.first.class).to eq Person
    end
  end

  describe "add relation" do
    let(:juno) { juno = "Juno" }
    let(:uno) { uno = "Uno" }
    let(:mno) { mno = "Mno" }
    let(:family_tree) {
      family_tree = FamilyTree.new
      family_tree.add(juno, "male")
      family_tree.add(uno, "male")
      family_tree.add(mno, "female")
      family_tree
    }

    it "should create a new family when new relation is added" do
      family_tree.add_relation_as(juno, "father", uno)

      expect(family_tree.family).not_to eq nil
    end

    context "connect Father to Son" do
      it "should assign father to family when father son relation is added" do
        family_tree.add_relation_as(juno, "father", uno)

        expect(family_tree.family.father.name).to eq juno
      end

      it "should assign childrens to family when father son relation is added" do
        family_tree.add_relation_as(juno, "father", uno)

        expect(family_tree.family.childrens.first.name).to eq uno
      end

      it "should set family instance variable of father" do
        family_tree.add_relation_as(juno, "father", uno)

        expect(family_tree.family.father.family).to eq family_tree.family
      end

      it "should set family instance variable of son" do
        family_tree.add_relation_as(juno, "father", uno)

        expect(family_tree.family.childrens.first.family).to eq family_tree.family
      end
    end

    context "Connect Son to Father" do
      it "should set father for family" do
        family_tree.add_relation_as(uno, "son", juno)

        member_juno = family_tree.get_member_by(juno)

        expect(member_juno.is_father?).to eq true
      end

      it "should connect son to father as family" do
        family_tree.add_relation_as(uno, "son", juno)

        member_uno = family_tree.get_member_by(uno)
        member_juno = family_tree.get_member_by(juno)

        expect(member_juno.family).to eq member_uno.family
      end

      it "should add son to family childrens list" do
        family_tree.add_relation_as(uno, "son", juno)
        member_juno = family_tree.get_member_by(juno)

        expect(member_juno.family.childrens.count).to eq 1
      end

      it "should add multiple to family childrens list" do
        family_tree.add_relation_as(uno, "son", juno)
        family_tree.add_relation_as(mno, "daughter", juno)

        member_juno = family_tree.get_member_by(juno)

        expect(member_juno.family.childrens.count).to eq 2
      end

      it "should add father to family with only siblings" do
        family_tree.add_relation_as(uno, "brother", mno)
        family_tree.add_relation_as(uno, "son", juno)

        member_mno = family_tree.get_member_by(mno)
        member_juno = family_tree.get_member_by(juno)

        expect(member_mno.family.father.name).to eq juno
        expect(member_mno.family).to eq member_juno.family
      end
    end

    context "connect Son to Mother" do
      it "should set mother for family" do
        family_tree.add_relation_as(uno, "son", mno)

        member_mno = family_tree.get_member_by(mno)

        expect(member_mno.is_mother?).to eq true
      end

      it "should connect son to father as family" do
        family_tree.add_relation_as(uno, "son", juno)

        member_uno = family_tree.get_member_by(uno)
        member_juno = family_tree.get_member_by(juno)

        expect(member_juno.family).to eq member_uno.family
      end
    end

    context "siblings" do
      it "should set add siblings to family" do
        family_tree.add_relation_as(uno, "brother", mno)

        member_mno = family_tree.get_member_by(mno)

        expect(member_mno.family.childrens.count).to eq 2
      end
    end

    context "Multiple Relation" do
      let(:juno) { juno = "Juno" }
      let(:uno) { uno = "Uno" }
      let(:mno) { mno = "Mno" }
      let(:tno) { tno = "Tno" }

      it "should create multiple relation" do
        family_tree = FamilyTree.new
        family_tree.add(juno, "male")
        family_tree.add(uno, "male")
        family_tree.add(tno, "male")
        family_tree.add(mno, "female")

        family_tree.add_relation_as(juno, "father", uno)
        family_tree.add_relation_as(uno, "father", tno)
        family_tree.add_relation_as(mno, "mother", tno)

        member_juno = family_tree.get_member_by(juno)
        member_uno = family_tree.get_member_by(uno)
        member_tno = family_tree.get_member_by(tno)
        member_mno = family_tree.get_member_by(mno)

        expect(member_uno.family).not_to eq nil
        expect(member_uno.family.father).to eq member_uno
        expect(member_uno.family.mother).to eq member_mno
        expect(member_uno.family.childrens.count).to eq 1
        expect(member_uno.parent_family).to eq member_juno.family
      end
    end
  end
end
