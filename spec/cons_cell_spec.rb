require 'minitest/autorun'
require_relative '../lib/zippers.rb'

describe Zippers::ConsCell do
  describe '#initialize' do
    it 'accepts a value which can be retrieved' do
      cell = Zippers::ConsCell.new 42
      assert_equal 42, cell.value
    end

    it 'accepts an optional reference to another cell' do
      bar = Zippers::ConsCell.new 'bar'
      foo = Zippers::ConsCell.new 'foo', bar

      assert_equal bar, foo.next_cell
    end
  end

  describe '#length' do
    it 'returns the length of the collection' do
      cell = Zippers::ConsCell.new(1, Zippers::ConsCell.new(2, Zippers::EmptyCell.new))
      assert_equal 2, cell.length
    end
  end
end
