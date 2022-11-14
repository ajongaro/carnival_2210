require './lib/carnival'
require './lib/visitor'
require './lib/ride'

RSpec.describe Carnival do
  let(:carnival) { Carnival.new(8)}
  describe '#initialize' do
    it 'exists' do
      expect(carnival).to be_a(Carnival)
      # days? hours?
      expect(carnival.duration).to eq(8)
      expect(carnival.rides).to eq([])
    end
  end
end