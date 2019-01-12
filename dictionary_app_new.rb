require 'http'

system "clear"

puts "Welcome to the Dictionary App"
puts ""

print "Enter a word: "
input_word = gets.chomp

puts ""

response = HTTP.get ("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
definitions = response.parse

list_number = 1

definitions.each.do |definition|
  puts "#{list_number} - #{definition["text"]}"
  puts ""

  list_number += 1
end 