class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = Array.new()
    end

    def full?
        if @passengers.length >= @capacity
            return true
        else
            return false
        end
    end

    def board_passenger(passenger)
        @passengers << passenger if !full? && passenger.has_flight?(@flight_number)
    end

    def list_passengers
        @passengers.inject([]) do |acc, passenger|
            acc + [passenger.name]
        end
    end

    def [](number)
        @passengers[number]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end
