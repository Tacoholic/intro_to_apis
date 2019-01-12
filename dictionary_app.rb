require 'http'
width = 80

system "clear"

puts "Welcome to the Dictionary App"
puts "=" * width
puts ""

print "Enter a word: "
input_word = gets.chomp

puts ""

response = HTTP.get ("https://api.wordnik.com/v4/word.json/#{ input_word }/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
definitions = response.parse


puts ""
puts "Definition"
puts "-" * width
puts ""


list_number = 1

definitions.each do |definition|
  puts "#{list_number} - #{definition["text"]}"
  puts ""

  list_number += 1
end 

response = HTTP.get ("https://api.wordnik.com/v4/word.json/#{ input_word }/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

top_example = response.parse

puts ""
puts "Top Example"
puts "-" * width
puts ""


p top_example["text"]



response = HTTP.get ("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=5&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
pronunciations = response.parse

puts ""
puts "pronunciation"
puts "-" * width
puts ""

pronunciations.each do |pronunciation|

  puts "  • #{ pronunciation["raw"] }"
end 