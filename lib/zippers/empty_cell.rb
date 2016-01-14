module Zippers
  # A singleton value to denote the end of a linked list.
  class EmptyCell
    def self.new
      @instance ||= super
    end

    def length
      0
    end
  end
end
