class Utils::Message

  def self.success(text)
    puts "SUCCESS:".bg_green + " #{text}"
  end

  def self.error(text)
    puts "ERROR:".bg_red + " #{text}"
  end
end
