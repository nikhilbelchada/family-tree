class Command

  def self.is_valid?(name)
    self.get_command_from(name) != nil
  end

  def self.get_command_from(text)
    Command.constants
      .select { |c| Command.const_get(c).is_a? Class }
      .collect { |c| Command.const_get(c) }
      .select { |c| c.match?(text) }
      .first
  end
end
