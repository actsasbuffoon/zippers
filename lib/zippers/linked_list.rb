module Zippers
  # An immutable singly-linked list. Provides methods for accessing head, tail,
  # and other simple operations. This intentionally omits operations like
  # finding the last element (which is an O(n) operation), so best avoided.
  class LinkedList
    attr_reader :values

    def initialize(*args)
      @values = if args.empty?
        EmptyCell.new
      else
        args.reverse_each.reduce(EmptyCell.new) { |a, e| ConsCell.new(e, a) }
      end
    end

    def self.from_cell(cell)
      instance = new
      instance.instance_variable_set :@values, cell
      instance
    end

    def ==(other)
      other.is_a?(LinkedList) && values == other.values
    end

    def length
      values.length
    end

    def map(&blk)
      updated = to_a.map(&blk)
      LinkedList.new(*updated)
    end

    def to_a
      [].tap do |results|
        current = values
        until current.is_a? EmptyCell
          results << current.value
          current = current.next_cell
        end
      end
    end

    def head
      values.value unless length == 0
    end

    def tail
      LinkedList.from_cell values.next_cell
    end

    def prepend(element)
      LinkedList.from_cell ConsCell.new(element, values)
    end
  end
end
