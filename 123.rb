class Person
  attr_accessor :name, :weight

  def self.speak
    puts "This is a class method baby!"
  end


  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def speak
    puts "My name is #{name}!"
  end


end

bill = Person.new("Bill", 145)
kyle = Person.new("Kyle", 123)
Jim = Person.new("Jim", 178)
Person = Person.new("Walter", 144)


bill.speak

kyle.speak

Jim.speak #looks like a class method, but it's really an instance method.

Person.speak