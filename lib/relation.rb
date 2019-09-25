class Relation

  def self.is_valid?(name)
    self.get_relation_from(name) != nil
  end

  def self.get_all_symbols
    Relation.constants
      .select { |c| Relation.const_get(c).is_a? Class }
      .collect { |c| Relation.const_get(c)::SYMBOLS }
      .flatten
  end

  def self.get_relation_from(name)
    Relation.constants
      .select { |c| Relation.const_get(c).is_a? Class }
      .collect { |c| Relation.const_get(c) }
      .select { |c| c::SYMBOLS.include?(name) }
      .first
  end

  def self.assign(first_person, relation_name, second_person)
    relation = self.get_relation_from(relation_name)
    relation.assign(first_person, second_person)
  end
end
