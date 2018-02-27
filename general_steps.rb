# Ruby study quiz one: The solitaire Cipher
# General Steps

class GeneralOperations

  attr_accessor :keystream

  # Keystream should be an array of integers, using 0 to represent a space, the range should be 1 to 26
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
    return result_array 
  end
end


class GenerateKeystream

  # smaller_joker, bigger_joker and last_card_index should be set to class variable constant
  # Because these elements are not supposed to change regardless of the deck settig.
  # Ask yourself if you wanna change these values below during the run time of the code. If the answer is no, then use CONSTANTS instead of class variable
  SMALLER_JOKER = 53
  LAST_CARD_INDEX = 53
  BIGGER_JOKER = 54

  # Because what I wanna do is to read from the keyed_deck, but do not wanna change it anyway. I use attr_reader instead of attr_accessor
  # To prevent it from changing the keyed_deck using "instance.keyed_deck = " is not allowd
  attr_reader :keyed_deck

  # Keyeddeck should be an array of integers ranging from 1 to 54
  def initialize(keyed_deck)
    @keyed_deck = keyed_deck
  end

  def move_one_down(given_deck = @keyed_deck)
    # Firstly, create a copy of the original keyed_deck as the operation deck, because I do not wanna touch or change the original keyed_deck
    # Note the difference between deep copy and shallow copy in ruby. How to deep copy an array or hash or class in ruby?
    operation_deck = Marshal.load(Marshal.dump(given_deck))
    # Check if the bottom card is the smaller joker A (or 53 in my case).
    # If it is, then move it under the top card. Otherwise, just move it under the next card
    if operation_deck[LAST_CARD_INDEX] == SMALLER_JOKER
      # Pop it out from the array and then insert it under the top card
      result_deck = operation_deck.insert(1, operation_deck.pop)
    else
      # If the smaller joker is not the bottom card, then just swap it with the card next to it
      result_deck = operation_deck.insert(operation_deck.index(SMALLER_JOKER) + 1, operation_deck.delete_at(operation_deck.index(SMALLER_JOKER)))
    end 
    return result_deck
  end

  def move_two_down(given_deck)
    operation_deck = Marshal.load(Marshal.dump(given_deck))
    if operation_deck[LAST_CARD_INDEX] == BIGGER_JOKER
      result_deck = operation_deck.insert(2, operation_deck.pop)
    elsif operation_deck[LAST_CARD_INDEX - 1] == BIGGER_JOKER
      result_deck = operation_deck.insert(1, operation_deck.delete_at(operation_deck.index(BIGGER_JOKER)))
    else
      result_deck = operation_deck.insert(operation_deck.index(BIGGER_JOKER) + 2, operation_deck.delete_at(operation_deck.index(BIGGER_JOKER)))
    end
    return result_deck
  end
end

=begin 

# This is the testing code for GenerateKeystream::move_two_down

keyed_deck_one = (1..54).to_a
keyed_deck_two = (1..52).to_a
keyed_deck_two << 54 << 53
keyed_deck_three = keyed_deck_two.shuffle

keystream_one = GenerateKeystream.new(keyed_deck_one)
puts keyed_deck_one.inspect
puts "--------"
result_one = keystream_one.move_two_down(keyed_deck_one)
puts result_one.inspect
keystream_two = GenerateKeystream.new(keyed_deck_two)
puts keyed_deck_two.inspect
puts "---------"
result_two = keystream_two.move_two_down(keyed_deck_two)
puts result_two.inspect
keystream_three = GenerateKeystream.new(keyed_deck_three)
puts keyed_deck_three.inspect
puts "----------"
result_three = keystream_three.move_two_down(keyed_deck_three)
puts result_three.inspect
keystrem_one = GenerateKeystream.new(keyed_deck_one)
puts keyed_deck_one.inspect
puts "----------"
result_four = keystrem_one.move_two_down(keyed_deck_two)
puts result_four.inspect
puts "-------------Here to see if the original keyed_deck attribute get changed or not-------------"
puts keystream_one.keyed_deck.inspect
puts keystream_two.keyed_deck.inspect
puts keystream_three.keyed_deck.inspect
=end

=begin
# This is the testing code for GenerateKeystream::move_one_down method

keyed_deck_one = (1..54).to_a
keyed_deck_two = (1..52).to_a
keyed_deck_two << 54 << 53
keyed_deck_three = keyed_deck_two.shuffle

keystream_one = GenerateKeystream.new(keyed_deck_one)
result_one = keystream_one.move_one_down
keystream_two = GenerateKeystream.new(keyed_deck_two)
result_two = keystream_two.move_one_down
keystream_three = GenerateKeystream.new(keyed_deck_three)
result_three = keystream_three.move_one_down
keystrem_one = GenerateKeystream.new(keyed_deck_one)
result_four = keystrem_one.move_one_down(keyed_deck_two)

puts keyed_deck_one.inspect
puts result_one.inspect
puts "-----"
puts keyed_deck_two.inspect
puts result_two.inspect
puts "-----"
puts keyed_deck_three.inspect
puts result_three.inspect
puts "-----"
puts keyed_deck_one.inspect
puts result_four.inspect
=end


=begin
# This is the testing code for the encrypt_char method

keystream_array = [4,23,10,24,8,0,25,18,6,4,7,0,20,13,19,8,16,0,21,21,18,24,10]
new_instance = GeneralOperations.new(keystream_array)
result = new_instance.encrypt_char("code in ruby, live longer")
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

