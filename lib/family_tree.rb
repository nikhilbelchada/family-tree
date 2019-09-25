class FamilyTree
  attr_reader :members, :family

  def initialize
    @members = []
    @family = Family.new
  end

  def add(member, gender)
    @members << Person.new(member, gender)
    puts "Success: Added #{member} to family tree".bg_green
  end

  def add_relation_as(first_person, relation, second_person)
    raise "Invalid Relation" unless Relation.is_valid?(relation)

    first_member = get_member_by(first_person)
    raise "Member #{first_person} do not exist, please add" unless first_member

    second_member = get_member_by(second_person)
    raise "Member #{second_person} do not exist, please add" unless second_member

    assign_family(first_member, second_member)
    Relation.assign(first_member, relation, second_member)
  end

  def assign_family(first_member,  second_member)
    if !first_member.belongs_to_family? and !second_member.belongs_to_family?
      @family = Family.new
      first_member.family = @family
      second_member.family = @family
    elsif first_member.belongs_to_family? and second_member.belongs_to_family?
      raise "Both belongs to existing family"
    end
  end

  def get_member_by(name)
    @members.select {|m| m.name == name}.first
  end
end
