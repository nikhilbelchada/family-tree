class Command::Relation
  def self.match?(text)
    get_match_symbol(text) != nil
  end

  def self.extract_options(text)
    symbol = get_match_symbol(text)
    first_person, second_person = text.split("as #{symbol} of")

    {
      first_person: first_person&.strip,
      second_person: second_person&.strip,
      symbol: symbol.strip,
    }
  end

  def self.get_match_symbol(text)
    ::Relation.get_all_symbols
      .select {|t| text.include?("as #{t} of")}
      .first
  end

  def self.execute(family_tree, options)
    family_tree.add_relation_as(options[:first_person], options[:symbol], options[:second_person])
  end
end
