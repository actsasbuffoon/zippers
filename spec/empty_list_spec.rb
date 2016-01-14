require 'minitest/autorun'
require_relative '../lib/zippers.rb'

describe Zippers::EmptyCell do
  describe '::new' do
    it 'returns the same instance each time' do
      assert_equal Zippers::EmptyCell.new, Zippers::EmptyCell.new
    end
  end

  describe '#length' do
    it 'returns 0' do
      assert_equal 0, Zippers::EmptyCell.new.length
    end
  end
end
