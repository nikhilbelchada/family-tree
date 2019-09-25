class Relation::Child
  SYMBOLS = ["daughter", "son", "child"]

  def self.assign(child, parent)
    self.assign_family(child, parent)

    family = child.family
    family.father = parent if parent.is_male?
    family.mother = parent if parent.is_female?

    family.add_children(child)

    puts "Success: Added #{child.name} as #{child.is_male? ? "son" : "daugher"} of #{parent.name}".bg_green
  end

  def self.assign_family(child, parent)
    if child.belongs_to_family? and !parent.belongs_to_family?
      parent.family = child.family
    elsif !child.belongs_to_family? and parent.belongs_to_family?
      child.family = parent.family
    else
      raise "Already belongs to family" if child.family.father != nil
      raise "Already belongs to family" if child.family.mother != nil

      family = parent.family
      child.family = family
      child.family.childrens.each {|c| family.add_children(c)}
    end
  end
end
