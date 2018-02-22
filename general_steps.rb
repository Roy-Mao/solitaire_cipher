# Ruby study quiz one: The solitaire Cipher
# General Steps

class GeneralOperations

  attr_accessor :keystream

  # Keystream should be an array of integers, using 0 to represent a space
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
    # Padding the created "X" into the string. Be aware of the order: 'X' should be in front  of the Fixnum
    sanitize_string = onlyupper_string + ('X' * x_number)
    # Add one space every five characters
    result_string = sanitize_string.gsub(/(.{5})/, '\1 ').strip
    # Return the final result
    return result_string
  end

=begin
Generate the encrypted characgters
=end
  def encrypt_char(given_string)
    # Convert the given_string(result_string) to numbers
    first_array = []
    given_string = sanitize_string(given_string)
    string_array = given_string.split('')
    string_array.each do |x|
     corresponding_digit_one = x.ord - 64
     first_array << corresponding_digit_one
    end
    # Combine the numbers in two arrays together and generate a new array
    generated_array = []
    first_array.each_with_index do |value, index|
      if value == -32 or keystream[index] == 0
        generated_ele = 0
      else
        generated_ele = value + keystream[index]
      end
      generated_array << generated_ele
    end
    # Conver the integers in generated_array back to characters
    result_array = []
    generated_array.each do |item|
      while item > 26 do
        item -= 26
      end 
      if item == 0
        item = " "
      else
        item += 64
      end
      item = item.chr
      result_array << item
    end
    # Return the generated characters as an array
    #puts result_array
    return result_array 
  end
end

=begin

# This is the testing code for the encrypt_char method

keystream_array = [4,49,10,24,8,0,51,44,6,4,33]
new_instance = GeneralOperations.new(keystream_array)
result = new_instance.encrypt_char("aaaaaaaaaa")
print result
=end


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
#puts teststring6
#puts testsample6
#puts testsample6.length
=end

