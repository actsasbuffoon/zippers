module Zippers
  class ZipperedLinkedList
    attr_reader :forward_list,
                :backward_list

    def initialize(forward_list, backward_list)
      @forward_list = forward_list
      @backward_list = backward_list
    end

    def self.from_elements(*args)
      new LinkedList.new(*args),
          LinkedList.new
    end

    def forward
      return self if forward_list.length == 0
      ZipperedLinkedList.new forward_list.tail,
                             backward_list.prepend(forward_list.head)
    end

    def backward
      return self if backward_list.length == 0
      ZipperedLinkedList.new forward_list.prepend(backward_list.head),
                             backward_list.tail
    end

    def replace(value)
      ZipperedLinkedList.new forward_list.tail.prepend(value),
                             backward_list
    end

    def insert(value)
      ZipperedLinkedList.new forward_list.prepend(value),
                             backward_list
    end

    def to_a
      backward_list.to_a.reverse + forward_list.to_a
    end

    def length
      backward_list.length + forward_list.length
    end

    def focused
      forward_list.head
    end
  end
end
