# frozen_string_literal: true

require_relative 'linked_list'

# Class for a hash map of key,value pairs
class HashMap
  attr_reader :length

  def initialize
    @buckets = Array.new(16) { LinkedList.new }
    @length = 0
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    list = list(key)
    node = list.find(key)

    if node.nil?
      list.append(key, value)
      self.length += 1
      # TODO: implement grow functionality when length > capacity * load_factor
    else
      node.value = value
    end
  end

  def get(key)
    list = list(key)
    node = list.find(key)

    return nil if node.nil?

    node.value
  end

  def has?(key)
    list = list(key)
    list.contains?(key)
  end

  def remove(key)
    list = list(key)
    value = list.remove(key)

    self.length -= 1 unless value.nil?

    value
  end

  def clear
    buckets.each(&:clear)
    self.length = 0
  end

  private

  attr_reader :load_factor
  attr_writer :length
  attr_accessor :buckets

  def capacity
    buckets.length
  end

  def list(key)
    index = hash(key) % capacity
    buckets[index]
  end
end
