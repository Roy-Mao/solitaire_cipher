# Ruby study quiz one: The solitaire Cipher
# General Steps

class GeneralOperations

  attr_accessor :keystream

  def initialize(keystream)
    @keystream = keystream
  end

=begin
Sanitize_string is used as the first step to sanitize a message to be enciphered
=end
  
  def sanitize_string(given_string)
    # Only keep letter characters
    onlyletter_string = given_string.gsub(/[^a-zA-z]/, "")
    # Change all letters to uppercase
    onlyupper_string = onlyletter_string.upcase
    # Setting the initial x number to 0
    x_number = 0
    # Decide how many 'X' should be padded into the string
    string_size = onlyupper_string.size
    if string_size < 1
      abort("ABORTED! The string size is less than 1\n")
    end
    if string_size % 5 != 0
      x_number = 5 - (string_size % 5)
    end
    # Padding the created "X" into the string
    sanitize_string = onlyupper_string + ('X' * x_number) # be aware of the order, 'X' should be in front of Fixnum
    return sanitize_string
  end
end


=begin

# This is the testing code for the sanitize_string function

testkeystream = "abcdefg"
new_sample = GeneralOperations.new(testkeystream)

teststring1 = "iloverubyes"
teststring2 = "I love python 2222"
teststring3 = "thiss Tring contains some !=fdsa//,<> marks!"
teststring4 = "023begin with number"
teststring5 = "this string \n contains some unprintable codes\n\n"
teststring6 = "   "
teststring7 = ""

testsample1 = new_sample.sanitize_string(teststring1)
testsample2 = new_sample.sanitize_string(teststring2)
testsample3 = new_sample.sanitize_string(teststring3)
testsample4 = new_sample.sanitize_string(teststring4)
testsample5 = new_sample.sanitize_string(teststring5)
#testsample6 = new_sample.sanitize_string(teststring6)
#testsample7 = new_sample.sanitize_string(teststring7)

puts teststring1
puts testsample1
puts testsample1.length
puts "--------------------"
puts teststring2
puts testsample2
puts testsample2.length
puts "--------------------"
puts teststring3
puts testsample3
puts testsample3.length
puts "--------------------"
puts teststring4
puts testsample4
puts testsample4.length
puts "--------------------"
puts teststring5
puts testsample5
puts testsample5.length
puts "--------------------"
puts teststring6
puts testsample6
puts testsample6.length

=end