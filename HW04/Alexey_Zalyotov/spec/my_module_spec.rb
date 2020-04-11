require 'my_module'

class Array
  include MyModule
end

describe '#my_each' do
  subject { Array.new([1, 2, 3]) }
  context 'when no block is given' do
    it 'returns an Enumerator' do
      expect(subject.my_each).to be_a(Enumerator)
      expect(subject.my_each.to_a).to match_array [1, 2, 3]
    end
  end

  context 'when block is given' do
    context 'when reciever is array [1, 2, 3]' do
      it 'puts elements in STDOUT' do
        expect do
          subject.my_each { |element| puts element }
        end.to output("1\n2\n3\n").to_stdout
      end

      it 'return array [1, 2, 3]' do
        variable = subject.my_each { |element| element }
        expect(variable).to match_array [1, 2, 3]
      end
    end

    context 'when reciever is an empty array' do
      subject { Array.new([]) }
      it 'return []' do
        variable = subject.my_each { |element| element }
        expect(variable).to match_array []
      end
    end
  end
end

describe '#my_map' do
  subject { Array.new([1, 2, 3]) }
  context 'when no block is given' do
    it 'returns an Enumerator' do
      expect(subject.my_map).to be_a(Enumerator)
    end
  end

  context 'when reciever is array [1, 2, 3]' do
    it 'should return array [2, 4, 6]' do
      result = subject.my_map { |element| element * 2 }
      expect(result).to match_array [2, 4, 6]
    end
  end
end

describe '#my_select' do
  subject { Array.new([1, 2, 3]) }
  context 'when no block is given' do
    it 'returns an Enumerator' do
      expect(subject.my_select).to be_a(Enumerator)
    end
  end

  context 'when reciever is array [1, 2, 3]' do
    it 'should return array [1, 2]' do
      result = subject.my_select { |element| element < 3 }
      expect(result).to match_array [1, 2]
    end
  end
end
