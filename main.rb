# frozen_string_literal: true

require_relative 'lib/hash_map'

APPLE = 'apple'
BANANA = 'banana'
CARROT = 'carrot'
DOG = 'dog'
ELEPHANT = 'elephant'
FROG = 'frog'
GRAPE = 'grape'
HAT = 'hat'
ICE_CREAM = 'ice cream'
JACKET = 'jacket'
KITE = 'kite'
LION = 'lion'
MOON = 'moon'
NA = 'n/a'

test_key_value_pairs = [
  [APPLE, 'red'],
  [BANANA, 'yellow'],
  [CARROT, 'orange'],
  [DOG, 'brown'],
  [ELEPHANT, 'gray'],
  [FROG, 'green'],
  [GRAPE, 'purple'],
  [HAT, 'black'],
  [ICE_CREAM, 'white'],
  [JACKET, 'blue'],
  [KITE, 'pink'],
  [LION, 'golden']
]

map = HashMap.new

puts 'TEST: set(key, value) with new entries'
test_key_value_pairs.each { |key, value| map.set(key, value) }
puts "Expected Length: #{test_key_value_pairs.length}, Actual Length: #{map.length}"
map.print
puts
puts

puts 'TEST: clear'
map.clear
puts "Expected Length: 0, Actual Length: #{map.length}"
map.print
puts
puts

puts 'TEST: set(key, value) with new entries after clear'
test_key_value_pairs.each { |key, value| map.set(key, value) }
puts "Expected Length: #{test_key_value_pairs.length}, Actual Length: #{map.length}"
map.print
puts
puts

puts 'TEST: set(key, value) with existing entries'
test_key_value_pairs.each do |pair|
  pair[1] = pair[1].reverse
  map.set(pair[0], pair[1])
end
puts "Expected Length: #{test_key_value_pairs.length}, Actual Length: #{map.length}"
map.print
puts
puts

puts 'TEST: set(key, value) when load factor is exceeded'
test_key_value_pairs << [MOON, 'silver']
map.set(test_key_value_pairs.last[0], test_key_value_pairs.last[1])
puts "Expected Length: #{test_key_value_pairs.length}, Actual Length: #{map.length}"
map.print
puts
puts

puts 'TEST: get(key)'
test_key_value_pairs.each { |pair| puts "Key: #{pair[0]}, Value: #{map.get(pair[0])}" }
puts "Key: #{NA}, Value: #{map.get(NA).nil? ? 'nil' : 'should not happen'}"
puts "Expected Length: #{test_key_value_pairs.length}, Actual Length: #{map.length}"
puts
puts

puts 'TEST: has?(key)'
test_key_value_pairs.each { |pair| puts "Has key #{pair[0]} ? #{map.has?(pair[0])}" }
puts "Has key #{NA} ? #{map.has?(NA)}"
puts "Expected Length: #{test_key_value_pairs.length}, Actual Length: #{map.length}"
puts
puts

puts 'TEST: keys'
puts "Expected Keys: #{test_key_value_pairs.map { |pair| pair[0] }.sort}"
puts "Actual Keys: #{map.keys.sort}"
puts "Expected Length: #{test_key_value_pairs.length}, Actual Length: #{map.length}"
puts
puts

puts 'TEST: values'
puts "Expected Values: #{test_key_value_pairs.map { |pair| pair[1] }.sort}"
puts "Actual Values: #{map.values.sort}"
puts "Expected Length: #{test_key_value_pairs.length}, Actual Length: #{map.length}"
puts
puts

puts 'TEST: entries'
puts "Expected Entries: #{test_key_value_pairs.sort { |a, b| a[0] <=> b[0] }}"
puts "Actual Entries: #{map.entries.sort { |a, b| a[0] <=> b[0] }}"
puts "Expected Length: #{test_key_value_pairs.length}, Actual Length: #{map.length}"
puts
puts

puts 'TEST: remove(key)'
test_key_value_pairs.each do |pair|
  old_length = map.length
  map.remove(pair[0])
  puts "Removed: #{pair[0]}, Expected Length: #{old_length - 1}, Actual Length: #{map.length}"
end
map.remove(NA)
puts "Removed: #{NA}, Expected Length: 0, Actual Length: #{map.length}"
