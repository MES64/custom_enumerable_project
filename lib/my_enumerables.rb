# frozen_string_literal: true

# Edit built-in Enumerable module
module Enumerable
  # Your code goes here

  def my_each_with_index(&block)
    item_index_pair = []
    idx = 0
    my_each do |item|
      item_index_pair << [item, idx]
      idx += 1
    end
    item_index_pair.my_each(&block)
    self
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self do
      yield(item)
    end
  end
end
