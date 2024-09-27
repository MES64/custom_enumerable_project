# frozen_string_literal: true

# Edit built-in Enumerable module
module Enumerable
  # Your code goes here

  def my_each_with_index
    idx = 0
    my_each do |item|
      yield(item, idx)
      idx += 1
    end
  end

  def my_select
    selected_items = []
    my_each do |item|
      selected_items << item if yield(item)
    end
    selected_items
  end

  def my_all?
    my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    count_num = 0
    my_each do |item|
      count_num += 1 if !block_given? || yield(item)
    end
    count_num
  end

  def my_map
    mapped_array = []
    my_each do |item|
      mapped_array << yield(item)
    end
    mapped_array
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
