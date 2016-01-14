require 'minitest/autorun'
require_relative '../lib/zippers.rb'

describe Zippers::ZipperedLinkedList do
  describe '#from_elements' do
    it 'creates an empty zippered linked list when called with no arguments' do
      list = Zippers::ZipperedLinkedList.from_elements
      assert_equal Zippers::EmptyCell.new, list.forward_list.values
      assert_equal Zippers::EmptyCell.new, list.backward_list.values
    end

    it 'creates a zippered linked list focused on the first element when data is passed in' do
      list = Zippers::ZipperedLinkedList.from_elements 1, 2, 3
      assert_equal [1, 2, 3], list.forward_list.to_a
      assert_equal Zippers::EmptyCell.new, list.backward_list.values
    end
  end

  describe '#forward' do
    it 'returns a new zippered linked list focused one element ahead' do
      list = Zippers::ZipperedLinkedList.from_elements 1, 2, 3
      forward = list.forward
      assert_equal [2, 3], forward.forward_list.to_a
      assert_equal [1], forward.backward_list.to_a
      # The original list is unchanged
      assert_equal [1, 2, 3], list.forward_list.to_a
      assert_equal Zippers::EmptyCell.new, list.backward_list.values
    end

    it 'returns the same list if it cannot move forward' do
      list = Zippers::ZipperedLinkedList.from_elements 1, 2, 3
      forward = list.forward.forward.forward
      assert_equal forward, forward.forward
    end
  end

  describe '#backward' do
    it 'returns a new zippered linked list focused one element behind' do
      list = Zippers::ZipperedLinkedList.from_elements(1, 2, 3).forward.forward
      backward = list.backward
      assert_equal [2, 3], backward.forward_list.to_a
      assert_equal [1], backward.backward_list.to_a
      # The original list is unchanged
      assert_equal [3], list.forward_list.to_a
      assert_equal [2, 1], list.backward_list.to_a
    end

    it 'returns the same list if it cannot move backward' do
      list = Zippers::ZipperedLinkedList.from_elements 1, 2, 3
      assert_equal list, list.backward
    end
  end

  describe '#to_a' do
    it 'returns an array representing the contents of the zippered linked list' do
      list = Zippers::ZipperedLinkedList.from_elements(1, 2, 3).forward
      assert_equal [1, 2, 3], list.to_a
    end
  end

  describe '#replace' do
    it 'returns a new zippered linked list with the passed value in place of the focused item' do
      list = Zippers::ZipperedLinkedList.from_elements(1, 2, 3).forward
      assert_equal [1, 42, 3], list.replace(42).to_a
      # The original list is unchanged
      assert_equal [1, 2, 3], list.to_a
    end
  end

  describe '#length' do
    it 'returns the length of the collection' do
      list = Zippers::ZipperedLinkedList.from_elements(1, 2, 3).forward
      assert_equal 3, list.length
    end
  end

  describe '#insert' do
    it 'returns a new zippered linked list with a new item inserted at the focal point' do
      list = Zippers::ZipperedLinkedList.from_elements(1, 2, 3).forward
      updated = list.insert(4)
      assert_equal [1, 4, 2, 3], updated.to_a
      # The original list is unchanged
      assert_equal [1, 2, 3], list.to_a
    end
  end

  describe '#focused' do
    it 'returns the currently focused value' do
      list = Zippers::ZipperedLinkedList.from_elements(1, 2, 3).forward
      assert_equal 2, list.focused
    end
  end
end
