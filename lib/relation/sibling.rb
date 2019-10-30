class Relation::Sibling
  SYMBOLS = ["sibling"]

  def self.assign(sibling_one, sibling_two)
    self.assign_family(sibling_one, sibling_two)

    family = sibling_one.family
    family.add_children(sibling_one)
    family.add_children(sibling_two)

    Utils::Message.success("Added #{sibling_one.name} as sibling of #{sibling_two.name}")
  end

  def self.assign_family(sibling_one, sibling_two)
    if sibling_one.belongs_to_family? and !sibling_two.belongs_to_family?
      sibling_two.family = sibling_one.family
    elsif !sibling_one.belongs_to_family? and sibling_two.belongs_to_family?
      sibling_one.family = sibling_two.family
    end
  end

  def self.search_for(person, options={})
    raise "#{person.name} does not belongs to any family" if person.family.nil?

    person.parent_family.nil? ? person.family.childrens : person.parent_family.childrens
  end

  def self.search_for(person, options={})
    nil
  end
end
