# frozen_string_literal: true

# Class for a node consisting of a key, value, and link to another node
class Node
  attr_reader :key
  attr_accessor :value, :link

  def initialize(key = nil, value = nil, link = nil)
    @key = key
    @value = value
    @link = link
  end

  def to_s
    "( #{key}:#{value} )"
  end
end
