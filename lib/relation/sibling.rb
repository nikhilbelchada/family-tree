class Relation::Sibling
  SYMBOLS = ["brother", "sister"]

  def self.assign(sibling_one, sibling_two)
    self.assign_family(sibling_one, sibling_two)

    family = sibling_one.family
    family.add_children(sibling_one)
    family.add_children(sibling_two)

    puts "Success: Added #{sibling_one.name} as sibling of #{sibling_two.name}".bg_green
  end

  def self.assign_family(sibling_one, sibling_two)
    if sibling_one.belongs_to_family? and !sibling_two.belongs_to_family?
      sibling_two.family = sibling_one.family
    elsif !sibling_one.belongs_to_family? and sibling_two.belongs_to_family?
      sibling_one.family = sibling_two.family
    end
  end
end
