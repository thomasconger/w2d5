class Item

    def self.valid_date?(date)
        #YYYY-MM-DD
        date = date.split("-")
        date.map! { |ele| ele.to_i }
        if date[1] > 12 || date[1] < 1
            return false
        elsif date[2] > 31 || date[2] < 1
            return false
        end
        true
    end

    attr_reader :deadline
    attr_accessor :title, :description

    def initialize(title, deadline, description)
        if !Item.valid_date?(deadline)
            raise "Invalid date"
        end
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "Invalid date"
        end
    end

end
