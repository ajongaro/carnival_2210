require './lib/visitor'

RSpec.describe Visitor do
  let(:visitor1) { Visitor.new('Bruce', 54, '$10')}

  describe '#initialize' do
    it 'exists' do
      expect(visitor1).to be_a(Visitor)
      expect(visitor1.name).to eq('Bruce')
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq(10)
      expect(visitor1.preferences).to eq([])
    end
  end
end