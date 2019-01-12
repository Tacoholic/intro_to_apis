require 'http'


system "clear"



puts "Welcome to the Dictionary App"
puts ""


print "Enter a word: "

input_word = gets.chomp



response  = HTTP.get("")

definitions = response.parse

list_number = 1


definitions.each do |definition|
  puts definition["text"]
end 