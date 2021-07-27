class Oystercard
attr_reader :balance

MAX_LIMIT = 90
MIN_LIMIT = 1

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    fail "Reached max limit of £90" if full?
    @balance += amount
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient funds to touch in" if underfare?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private
  def full?
    @balance >= MAX_LIMIT
  end

  def underfare?
    @balance < MIN_LIMIT
  end

end
