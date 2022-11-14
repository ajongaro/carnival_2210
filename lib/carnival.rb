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
    all_rides.max_by { |ride, count| count }.first
  end
end