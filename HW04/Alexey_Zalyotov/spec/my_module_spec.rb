require 'my_module'

class Array
  def initialize(arr)
    @arr = arr
  end

  include MyModule
end

RSpec.describe MyModule do
  subject { array }
  let(:array) { Array.new([1, 2, 3]) }

  describe '#my_each' do
    context 'when no block is given' do
      it 'returns an Enumerator' do
        expect(array.my_each).to be_a(Enumerator)
        # expect(array.my_each.to_a).to eq(array)
      end
    end
  end

  describe '#my_map' do
    context 'when no block is given' do
      it 'returns an Enumerator' do
        expect(array.my_map).to be_a(Enumerator)
      end
    end
  end

  describe '#my_select' do
    context 'when no block is given' do
      it 'returns an Enumerator' do
        expect(array.my_select).to be_a(Enumerator)
      end
    end
  end
end
