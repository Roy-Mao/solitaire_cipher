class Foo
  def mydef1(sometext)
  	puts sometext
  end

  def mydef2(sometexttoo)
    mydef1(sometexttoo)
  end


end

myinstance = Foo.new

myinstance.mydef1("abc")

puts '------------'

myinstance.mydef2("abcd")