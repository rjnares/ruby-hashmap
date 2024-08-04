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
      resize if grow?
    else
      node.value = value
    end
  end

  def get(key)
    node = list(key).find(key)

    return nil if node.nil?

    node.value
  end

  def has?(key)
    list(key).contains?(key)
  end

  def remove(key)
    value = list(key).remove(key)

    self.length -= 1 unless value.nil?

    value
  end

  def clear
    buckets.each(&:clear)
    self.length = 0
  end

  def keys
    keys = []

    buckets.each do |list|
      current = list.head

      until current.nil?
        keys << current.key
        current = current.link
      end
    end

    keys
  end

  def values
    values = []

    buckets.each do |list|
      current = list.head

      until current.nil?
        values << current.value
        current = current.link
      end
    end

    values
  end

  def entries
    entries = []

    buckets.each do |list|
      current = list.head

      until current.nil?
        entries << [current.key, current.value]
        current = current.link
      end
    end

    entries
  end

  def print
    buckets.each_with_index { |list, index| puts "#{index}: #{list}" }
  end

  private

  attr_reader :load_factor
  attr_writer :length
  attr_accessor :buckets

  def list(key)
    index = hash(key) % buckets.length
    buckets[index]
  end

  def grow?
    length > buckets.length * load_factor
  end

  def resize
    old_buckets = buckets
    self.buckets = Array.new(buckets.length * 2) { LinkedList.new }
    self.length = 0

    old_buckets.each do |list|
      current = list.head

      until current.nil?
        set(current.key, current.value)
        current = current.link
      end
    end
  end
end
