# frozen_string_literal: true

require_relative 'lib/hash_map'

hash_map = HashMap.new

puts "Expected Length: 0, Actual Length: #{hash_map.length}"

test_key_set = [
  'apple',
  'banana',
  'carrot',
  'dog',
  'elephant',
  'frog',
  'grape',
  'hat',
  'ice cream',
  'jacket',
  'kite',
  'lion'
]

test_key_set.each { |key| puts "'#{key}' hash code: #{hash_map.hash(key)}" }
