class Person
  attr_reader :ethics
  attr_accessor :name

  def initialize(name, ethics)
  	@name = name
  	@ethics = ethics
  end

  def change_ethics(str)
  	@ethics = str
  end 

end

person1 = Person.new("Roy", "Asian")

puts person1.name
puts person1.ethics
puts "now lets change the ethics of roy to African"
#person1.ethics("Africans") 
puts person1.ethics