require './lib/carnival'
require './lib/visitor'
require './lib/ride'

RSpec.describe Carnival do
  let(:carnival) { Carnival.new(8)}
  let(:ride1) { Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle }) }
  let(:ride2) { Ride.new({ name: 'Skill Game', min_height: 36, admission_fee: 2, excitement: :gentle }) }
  let(:ride3) { Ride.new({ name: 'Death Drop', min_height: 48, admission_fee: 5, excitement: :thrilling }) }
  let(:visitor1) { Visitor.new('Bruce', 54, '$10')}
  let(:visitor2) { Visitor.new('Tucker', 36, '$5')}
  let(:visitor3) { Visitor.new('Penny', 64, '$15')}

  describe '#initialize' do
    it 'exists' do
      expect(carnival).to be_a(Carnival)
      # days? hours?
      expect(carnival.duration).to eq(8)
      expect(carnival.rides).to eq([])
    end
  end

  describe '#add_ride()' do
    it 'adds rides to carnival' do
      expect(carnival.rides).to eq([])

      carnival.add_ride(ride1)
      expect(carnival.rides).to eq([ride1])
      
      carnival.add_ride(ride2)
      expect(carnival.rides).to eq([ride1, ride2])
    end
  end

  describe '#most_popular_ride' do
    it 'returns most popular ride of carnival' do

    end
  end
end