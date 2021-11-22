class Oystercard
    attr_reader :balance, :entry_station

    BALANCE_LIMIT = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
        @in_journey = false
        @entry_station
    end

    def top_up(amount)
        fail 'can not top up more than £#{BALANCE_LIMIT}' if amount + @balance > BALANCE_LIMIT
        @balance += amount
    end

    def in_journey?
       @in_journey
    end

    def touch_in(station)
        fail 'Insufficient funds, minimum fare is £#{MINIMUM_FARE}' if @balance < MINIMUM_FARE
        @in_journey = true
        @entry_station = station
    end

    def touch_out
        @in_journey = false
        deduct(MINIMUM_FARE)
    end

    private

    def deduct(amount)
        @balance -= amount
    end

end