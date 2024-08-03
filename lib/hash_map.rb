# frozen_string_literal: true

# Class for a hash map of key,value pairs
class HashMap
  attr_reader :length

  def initialize
    @buckets = Array.new(16)
    @length = 0
    @load_factor = 0.75
  end

  private

  attr_reader :load_factor

  def capacity
    @buckets.length
  end
end
