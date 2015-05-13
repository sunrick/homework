class Human

  def initialize(name)
    @name = name
    @alertness = 0.0
  end

  def alertness
    @alertness
  end

  def has_coffee?
    false
  end

  def needs_coffee?
    true
  end

  def buy(coffee)
    @coffee = coffee
  end

  def drink!
    @alertness += 0.33
    @coffee.reduce_drink
  end

end