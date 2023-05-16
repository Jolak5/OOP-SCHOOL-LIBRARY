class Person
  attr_reader :id, :name, :age

  def initialize(name= "Unknown", age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  
  def name
    @name
  end

    def age
        @age
    end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || :parent_permission
  end
end

