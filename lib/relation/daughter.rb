class Relation::Daughter < Relation::Child
  SYMBOLS = ["daughter"]

  def self.search_for(person, options={})
    return [] if person.family.nil?
    return [] unless person.is_parent?

    if options[:all] == true
      search_in_depth(person, options)
    else
      childrens = person.family.childrens
      childrens.select {|c| c.is_female? }
    end
  end

  def self.search_in_depth(person, options)
    family = person.family
    daughters = family.childrens.select {|c| c.is_female? }

    extended_daughters = family.childrens.collect do |children|
      next if children.family == family
      self.search_for(children, options)
    end.flatten.compact

    daughters + extended_daughters
  end
end
