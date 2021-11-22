class Oystercard
    attr_reader :balance, :entry_station, :exit_station

    BALANCE_LIMIT = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
        @entry_station
        @exit_station
    end

    def top_up(amount)
        fail 'can not top up more than £#{BALANCE_LIMIT}' if amount + @balance > BALANCE_LIMIT
        @balance += amount
    end

    def in_journey?
       true unless @entry_station.nil?
    end

    def touch_in(station)
        fail 'Insufficient funds, minimum fare is £#{MINIMUM_FARE}' if @balance < MINIMUM_FARE
        @entry_station = station
    end

    def touch_out(station)
        deduct(MINIMUM_FARE)
        @entry_station = nil
        @exit_station = station
    end

    private

    def deduct(amount)
        @balance -= amount
    end

end