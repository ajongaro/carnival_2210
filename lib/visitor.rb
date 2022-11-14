class Visitor
  attr_reader :name, :height, :preferences, :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete("$").to_i
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height_requirement)
    @height >= height_requirement
  end

  def can_afford?(admission_fee)
    @spending_money >= admission_fee
  end

  def pay(admission_fee)
    @spending_money -= admission_fee
  end
end
