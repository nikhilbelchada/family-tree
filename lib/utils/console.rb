class Utils::Console
  def self.start
    command = get_input

    family_tree = FamilyTree.new

    while(command != "exit")

      begin
        command, options = Utils::Parser.parse(command)
        command.execute(family_tree, options)
      rescue Exception => e
        puts "Error: #{e}".bg_red
      end

      puts
      command = get_input
    end
  end

  def self.get_input
    print "Family Tree>"
    print " "
    gets.chomp
  end
end
