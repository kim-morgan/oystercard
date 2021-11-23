class Journey

    MINIMUM_FARE = 1
    PENALTY_FARE = 6

    def initialize(entry_station = nil)
        @entry_station = entry_station
        @exit_station
    end

    def entry_station(station = @entry_station)
        @entry_station = station
    end

    def exit_station(station = @exit_station)
        @exit_station = station
    end

    def complete?
        !@entry_station.nil? && !@exit_station.nil?
    end

    def fare
        complete? ? MINIMUM_FARE : PENALTY_FARE
    end
end