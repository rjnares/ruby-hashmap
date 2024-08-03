# frozen_string_literal: true

require_relative 'node'

# Class for a linked list of nodes
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
    @length = 0
  end

  def append(key, value)
    if head.nil?
      self.head = Node.new(key, value)
    else
      current = head
      current = current.link until current.link.nil?
      current.link = Node.new(key, value)
    end

    self.length += 1
  end

  def contains?(key)
    current = head

    until current.nil?
      return true if current.key == key

      current = current.link
    end

    false
  end

  def find(key)
    current = head

    until current.nil?
      return current if current.key == key

      current = current.link
    end

    nil
  end

  def to_s
    node_strings = []
    current = head

    until current.nil?
      node_strings << current.to_s
      current = current.link
    end

    node_strings << 'nil'
    node_strings.join(' -> ')
  end

  private

  attr_accessor :length
end
