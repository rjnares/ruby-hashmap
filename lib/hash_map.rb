# frozen_string_literal: true

# Class for a hash map of key,value pairs
class HashMap
  attr_reader :length

  def initialize
    @buckets = Array.new(16)
    @length = 0
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  private

  attr_reader :load_factor

  def capacity
    @buckets.length
  end
end
