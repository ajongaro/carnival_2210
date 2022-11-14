class Carnival
  attr_reader :duration, :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def all_rides
    hash = {} 
    @rides.each do |ride|
      hash[ride] = ride.total_rides
    end
    hash
  end

  def most_popular_ride
    most_popular = all_rides.max_by { |ride, count| count }
    most_popular.delete_if { |x| x.class == Integer } 
  end

  def all_rides_with_revenue
    hash = {}
    all_rides.each do |ride, _|
       hash[ride] = ride.total_revenue
    end
    hash
  end

  def most_profitable_ride
    top_ride = all_rides_with_revenue.max_by { |ride, count| count }
    top_ride.delete_if { |x| x.class == Integer }
  end
end