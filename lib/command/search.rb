class Command::Search
  def self.match?(text)
    text.start_with?("get ")
  end

  def self.extract_options(text)
    symbol = get_match_symbol(text)

    command, person_name = text.split(" #{symbol} of")

    {
      symbol: symbol&.strip,
      person_name: person_name&.strip,
      all: command.include?(" all")
    }
  end

  def self.get_match_symbol(text)
    ::Relation.get_all_symbols
      .select {|t| text.include?(" #{t} of ")}
      .first
  end

  def self.execute(family_tree, options)
    search_results = family_tree
      .search_for(options[:symbol], options[:person_name], options)
      .collect(&:name)
      .join(", ")

    Utils::Message.success(search_results)
  end
end
