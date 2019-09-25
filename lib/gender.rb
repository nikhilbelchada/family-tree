class Gender
  MALE = "male"
  FEMALE = "female"

  GENDERS = [MALE, FEMALE]

  def self.is_valid?(gender)
    GENDERS.include? gender
  end
end
