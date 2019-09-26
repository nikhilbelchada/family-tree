class Relation::Mother
  SYMBOLS = ["mother"]

  def self.assign(mother, child)
    self.assign_family(mother, child)

    mother.family.mother = mother
    child.family.add_children(child)

    Utils::Message.success("Added #{mother.name} as mother of #{child.name}")
  end

  def self.assign_family(mother, child)
    if mother.belongs_to_family? and !child.belongs_to_family?
      family = mother.family
      child.family = family
    elsif !mother.belongs_to_family? and child.belongs_to_family?
      family = child.family
      mother.family = family
    end
  end
end
