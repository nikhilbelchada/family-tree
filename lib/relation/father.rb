class Relation::Father
  SYMBOLS = ["father"]

  def self.assign(father, child)
    self.assign_family(father, child)

    father.family.father = father
    child.family.add_children(child)

    Utils::Message.success("Added #{father.name} as father of #{child.name}")
  end

  def self.assign_family(father, child)
    if father.belongs_to_family? and !child.belongs_to_family?
      unless father.is_father?
        father.parent_family = father.family
        father.family = Family.new
      end

      child.family = father.family
    elsif !father.belongs_to_family? and child.belongs_to_family?
      family = child.family
      father.family = family
    end
  end

  def self.search_for(person, options={})
    nil
  end
end
