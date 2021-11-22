class Oystercard
    attr_reader :balance

    BALANCE_LIMIT = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
        @in_journey = false
    end

    def top_up(amount)
        fail 'can not top up more than £#{BALANCE_LIMIT}' if amount + @balance > BALANCE_LIMIT
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
       @in_journey
    end

    def touch_in
        fail 'Insufficient funds, minimum fare is £#{MINIMUM_FARE}' if @balance < MINIMUM_FARE
        @in_journey = true
    end

    def touch_out
        @in_journey = false
    end

end