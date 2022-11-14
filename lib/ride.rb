class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :rider_log

  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @rider_log = Hash.new(0)
  end

  def board_rider(visitor)
    if visitor.preferences.include?(@excitement) &&
      visitor.tall_enough?(@min_height)
      
      visitor.pay(@admission_fee)
      @rider_log[visitor] += 1
    end
  end

  def total_rides
    @rider_log.values.sum
  end

  def total_revenue
    total_rides * @admission_fee
  end
end
