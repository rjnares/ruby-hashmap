# Ruby Hash Map

This is my implementation of the [Hash Map](https://www.theodinproject.com/lessons/ruby-hashmap) project assigned in the [Computer Science](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#a-bit-of-computer-science) section of the [Ruby](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) course which is part of the [Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails) curriculum from [The Odin Project](https://www.theodinproject.com/).

## Project Description

Although Ruby provides the hash data structure, the main goal of this project was to implement a hash map data structure to understand how it works internally.

### Classes

My implementation includes the following classes:
* A `Node` class representing a unit of data which consists of a key, value, and link to the next node
* A `LinkedList` class consisting of an ordered list of `Node` objects starting with a "head" node
* A `HashMap` class consisting of an array of "buckets" where each bucket is a `LinkedList` object

#### Node Class

The `Node` class contains the following instance methods:
* `#key` which reads the `key` instance variable value
* `#value` which reads and writes the `value` instance variable value
* `#link` which reads and writes the `link` instance variable value
* `#to_s` which returns a string representation of the node's key and value in the following format `( key:value )`

#### LinkedList Class

The `LinkedList` class contains the following instance methods:
* `#head` which reads the `head` instance variable value
* `#append(key, value)` which adds a new `Node` containing the `key` and `value` to the end of the list
* `#contains?(key)` which returns `true` if there is a `Node` with the given `key` in the list, or `false` otherwise
* `#find(key)` which returns a `Node` with the given `key` if it exists in the list, or `nil` otherwise
* `#remove(key)` which removes a `Node` with the given `key` and returns its value if it exists in the list, or `nil` otherwise
* `#clear` which removes all nodes from the list
* `#to_s` which returns a string representation of the linked list in the following format: `( key:value ) -> ( key:value ) -> ( key:value ) -> nil`

#### HashMap Class

The `HashMap` class contains the following instance methods:
* `#length` which reads the `length` instance variable value for the number of entries in the hash map
* `#hash(key)` which returns a hash code for a given `key`
* `#set(key, value)` which adds a new entry or updates the `value` of the given `key` if it already exists in the hash map; it will also double the number of buckets if the `length` exceeds the `load factor` of `0.75`
* `#get(key)`which returns the `value` of the given `key` if it exists in the hash map, or `nil` otherwise
* `#has?(key)` which returns `true` if the given `key` is in the hash map, or `false` otherwise
* `#remove(key)` which removes a `key` and returns its value if it exists in the hash map, or `nil` otherwise
* `#clear` which removes all entries from the hash map
* `#keys` which returns an array containing all the keys in the hash map
* `#values` which returns an array containing all the values in the hash map
* `#entries` which returns an array containing all the entries in the hash map in the following format: `[[key_1, value_1], [key_2, value_2], [key_3, value_3]]`