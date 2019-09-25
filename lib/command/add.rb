class Command::Add

  def self.match?(text)
    text.include?("add")
  end

  def self.extract_options(text)
    command_text, person, gender = text.split(" ")
    {person: person&.strip, gender: gender&.strip}
  end

  def self.execute(family_tree, options)
    family_tree.add(options[:person], options[:gender])
  end
end
