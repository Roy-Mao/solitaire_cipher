class Foo
  
  @@classvar1 = 1
  @@classvar2 = 2

  attr_accessor :attr_one, :attr_two

  def initialize(attr_one, attr_two)
  	@attr_one = attr_one
  	@attr_two = attr_two
  end

  def show
  	puts @attr_one
  	puts @attr_two
  end


end

myinstance = Foo.new("var1", "var2")

myinstance.show