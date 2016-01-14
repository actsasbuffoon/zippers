module Zippers
  # An immutable cons cell. It holds a single value and a pointer to the next
  # cell. If this is the end of the list then it should point at EmptyCell.
  #
  # It's usually an O(n) operation to find the length of a linked list, but we
  # can store the value directly in the list since it's immutable (the length of
  # the tail will never change).
  class ConsCell
    attr_reader :value,
                :next_cell,
                :length

    def initialize(value, next_cell = EmptyCell.new)
      @value = value
      @next_cell = next_cell
      @length = next_cell.length + 1
    end

    def ==(other)
      other.is_a?(ConsCell) && value == other.value && next_cell == other.next_cell
    end
  end
end
