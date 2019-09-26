class Person
  attr_reader :name, :parent_family, :gender, :family

  def initialize(name, gender)
    raise "Invalid Gender" unless Gender.is_valid?(gender)

    @name = name
    @gender = gender
    @family = nil
    @parent_family = nil
  end

  def name
    @name
  end

  def gender
    @gender
  end

  def is_male?
    @gender == Gender::MALE
  end

  def is_female?
    @gender == Gender::FEMALE
  end

  def family=(family)
    @family = family
  end

  def parent_family=(family)
    @parent_family = family
  end

  def belongs_to_family?
    @family != nil
  end

  def is_father?
    @family.father == self
  end

  def is_mother?
    @family.mother == self
  end

  def is_parent?
    is_father? or is_mother?
  end

  def search(relation, options)
  end

  def to_json
    {
      name: @name,
      gender: @gender,
      parent_family: @parent_family&.father&.name,
      family: @family&.father&.name,
    }
  end
end
