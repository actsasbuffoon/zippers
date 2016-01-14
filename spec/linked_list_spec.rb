require 'minitest/autorun'
require_relative '../lib/zippers.rb'

describe Zippers::LinkedList do
  describe '#initialize' do
    it 'creates an empty list when called with no arguments' do
      assert_equal Zippers::EmptyCell.new, Zippers::LinkedList.new.values
    end

    it 'creates a ConsCell when called with one argument' do
      list = Zippers::LinkedList.new 42
      assert_equal Zippers::ConsCell.new(42, Zippers::EmptyCell.new), list.values
    end

    it 'creates multiple linked cons cells when called with multiple arguments' do
      list = Zippers::LinkedList.new 1, 2, 3
      assert_equal Zippers::ConsCell.new(
                     1,
                     Zippers::ConsCell.new(
                       2,
                       Zippers::ConsCell.new(
                         3,
                         Zippers::EmptyCell.new
                       )
                     )
                   ),
                   list.values
    end
  end

  describe '::from_cell' do
    it 'returns a new LinkedList based on a cell' do
      list = Zippers::LinkedList.from_cell Zippers::ConsCell.new(42, Zippers::EmptyCell.new)
      assert_equal Zippers::LinkedList.new(42), list
    end
  end

  describe '#length' do
    it 'returns the length of the list' do
      assert_equal 3, Zippers::LinkedList.new(1, 2, 3).length
    end
  end

  describe '#map' do
    it 'returns a new list where a function has been applied to each entry' do
      list = Zippers::LinkedList.new 1, 2, 3
      assert_equal [3, 4, 5], list.map { |x| x + 2 }.to_a
    end
  end

  describe '#to_a' do
    it 'convers a list to an array' do
      list = Zippers::LinkedList.new 1, 2, 3
      assert_equal [1, 2, 3], list.to_a
    end
  end

  describe '#head' do
    it 'returns the first value in the list' do
      list = Zippers::LinkedList.new 1, 2, 3
      assert_equal 1, list.head
    end

    it 'returns nil if the list is empty' do
      list = Zippers::LinkedList.new
      assert_equal nil, list.head
    end
  end

  describe '#tail' do
    it 'returns a new list without the head' do
      list = Zippers::LinkedList.new 1, 2, 3
      assert_equal [2, 3], list.tail.to_a
    end
  end

  describe '#prepend' do
    it 'returns a new list with an element prepended' do
      list = Zippers::LinkedList.new 1, 2, 3
      assert_equal [0, 1, 2, 3], list.prepend(0).to_a
      assert_equal [1, 2, 3], list.to_a
    end
  end
end
