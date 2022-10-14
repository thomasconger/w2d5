require_relative "item"

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = Array.new
    end

    def add_item(item, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(item, deadline, description)
            true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        length = @items.length
        if index >= length || index < 0
            return false
        end
        true
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](index)
        if self.valid_index?(index)
            @items[index]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "-----------------------------------------"
        puts "#{@label.rjust(22)}"
        puts "-----------------------------------------"
        puts "Index | Item                | Deadline  "
        puts "-----------------------------------------"
        @items.each_with_index do |item, index|
            puts "#{index.to_s.ljust(6)}| #{item.title.ljust(20)}| #{item.deadline}"
        end
    end

    def print_full_item(index)
        if self.valid_index?(index) == false then return false end
        puts "-----------------------------------------"
        puts "#{@items[index].title}#{@items[index].deadline.rjust(35)}"
        puts "#{@items[index].description}"
    end



end
