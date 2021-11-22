class Oystercard
    attr_reader :balance
    BALANCE_LIMIT = 90

    def initialize
        @balance = 0
    end

    def top_up(amount)
        fail 'can not top up more than £#{BALANCE_LIMIT}' if amount + @balance > BALANCE_LIMIT
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

end