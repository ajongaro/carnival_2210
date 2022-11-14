require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  let(:ride1) { Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle }) }
  let(:visitor1) { Visitor.new('Bruce', 54, '$10')}
  let(:visitor2) { Visitor.new('Tucker', 36, '$5')}
  let(:visitor3) { Visitor.new('Penny', 64, '$15')}

  describe '#initialize' do
    it 'exists' do
      expect(ride1).to be_a(Ride)   
      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.rider_log).to eq({})
    end
  end

  describe '#board_rider()' do
    it 'logs a rider into rider_log' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      ride1.board_rider(visitor1)
      expect(ride1.total_rides).to eq(1)
      expect(ride1.rider_log).to eq({ visitor1 => 1 })

      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      expect(ride1.total_rides).to eq(3)
      expect(ride1.rider_log).to eq({ visitor1 => 2, visitor2 => 1 })
    end

    it 'charges an admission fee' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      expect(visitor1.spending_money).to eq(10)
      ride1.board_rider(visitor1)
      expect(visitor1.spending_money).to eq(9)

      visitor1.pay(ride1.admission_fee)

      expect(visitor1.spending_money).to eq(8)
    end
  end
  
  describe '#total_revenue' do
    it 'returns current total revenue generated' do
      expect(ride1.rider_log).to eq({})
      expect(ride1.total_revenue).to eq(0)
    end
  end
end