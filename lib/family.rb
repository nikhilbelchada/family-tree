class Family
  attr_reader :childrens, :father, :mother

  def initialize()
    @childrens = []
  end

  def father=(father)
    @father = father
  end

  def mother=(mother)
    @mother = mother
  end

  def add_children(children)
    return if @childrens.select {|c| c == children }.count > 0
    @childrens << children
  end

  def to_json
    {
      childrens: @childrens,
      father: @father,
      mother: @mother
    }
  end
end
