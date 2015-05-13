class Coffee

  def initialize(type)
    @type = type
    @full = 3
    @empty = 3
  end

  def full?
    @full == 3
  end

  def empty?
    @empty == 0
  end

  def reduce_drink
    @full -= 1
    @empty -= 1
  end

end