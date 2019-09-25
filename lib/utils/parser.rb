class Utils::Parser
  def self.parse(text)
    command = Command.get_command_from(text)
    raise "Invalid Command" if command.nil?

    [command, command.extract_options(text)]
  end
end
