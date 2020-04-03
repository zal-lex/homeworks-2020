require 'my_module'

class Array
  def initialize(arr)
    @arr = arr
  end

  include MyModule
end

describe '#my_each' do
  subject { array }
  let(:array) { Array.new([1, 2, 3]) }
  context 'when no block is given' do
    it 'returns an Enumerator' do
      expect(array.my_each).to be_a(Enumerator)
    end
  end

  context 'when reciever is array [1, 2, 3]' do
    it 'return modified elements' do
      result = array.my_each { |element| puts element * 2 }
      specify { expect(result).to output("2\n4\n6").to_stdout }
    end
  end
end

describe '#my_map' do
  subject { array }
  let(:array) { Array.new([1, 2, 3]) }
  context 'when no block is given' do
    it 'returns an Enumerator' do
      expect(array.my_map).to be_a(Enumerator)
    end
  end

  context 'when reciever is array [1, 2, 3]' do
    it 'should return array' do
      result = array.my_map { |element| element * 2 }
      expect(result).to match_array [2, 4, 6]
    end
  end
end

describe '#my_select' do
  subject { array }
  let(:array) { Array.new([1, 2, 3]) }
  context 'when no block is given' do
    it 'returns an Enumerator' do
      expect(array.my_select).to be_a(Enumerator)
    end
  end

  context 'when reciever is array [1, 2, 3]' do
    it 'should return array' do
      result = array.my_select { |element| element < 3 }
      expect(result).to match_array [1, 2]
    end
  end
end
