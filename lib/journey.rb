class Journey
    attr_reader :entry_station

    def initialize(entry_station)
        @entry_station = entry_station
        @exit_station
    end

    def exit_station(station = @exit_station)
        @exit_station = station
    end

    def complete?
        true
    end

end