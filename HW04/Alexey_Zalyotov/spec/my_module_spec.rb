require 'my_module'

class Array
  include MyModule
end

# rubocop:disable Metrics/BlockLength
RSpec.describe '#my_each' do
  subject { Array.new([1, 2, 3]).my_each(&block) }
  context 'when no block is given' do
    let(:block) {}
    context 'and reciever is array [1, 2, 3]' do
      it 'returns an Enumerator' do
        expect(subject).to be_a(Enumerator)
      end
      it '.to_a returns array [1, 2, 3]' do
        expect(subject.to_a).to match_array [1, 2, 3]
      end
    end

    context 'or reciever is an empty array' do
      subject { Array.new([]).my_each(&block) }
      it 'returns an Enumerator' do
        expect(subject).to be_a(Enumerator)
      end
      it '.to_a returns an empty array' do
        expect(subject.to_a).to match_array []
      end
    end
  end

  context 'when the block { ->(a) { puts a } } is given' do
    let(:block) { ->(a) { puts a } }
    context 'and reciever is array [1, 2, 3]' do
      it 'puts elements in STDOUT and returns array [1, 2, 3]' do
        expect { subject }.to output("1\n2\n3\n").to_stdout
        expect(subject).to match_array [1, 2, 3]
      end
    end

    context 'or reciever is an empty array' do
      subject { Array.new([]).my_each(&block) }
      it 'returns an empty array' do
        expect(subject).to match_array []
      end
    end
  end

  context 'when the block { ->(a) { puts a * a } } is given' do
    let(:block) { ->(a) { puts a * a } }
    context 'and reciever is array [1, 2, 3]' do
      it 'puts changed elements in STDOUT and returns array [1, 2, 3]' do
        expect { subject }.to output("1\n4\n9\n").to_stdout
        expect(subject).to match_array [1, 2, 3]
      end
    end

    context 'or reciever is an empty array' do
      subject { Array.new([]).my_each(&block) }
      it 'returns an empty array' do
        expect(subject).to match_array []
      end
    end
  end
end

RSpec.describe '#my_map' do
  subject { Array.new([1, 2, 3]).my_map(&block) }
  context 'when no block is given' do
    let(:block) {}
    context 'and reciever is array [1, 2, 3]' do
      it 'returns an Enumerator' do
        expect(subject).to be_a(Enumerator)
      end
      it '.to_a returns array [1, 2, 3]' do
        expect(subject.to_a).to match_array [1, 2, 3]
      end
    end

    context 'or reciever is an empty array' do
      subject { Array.new([]).my_map(&block) }
      it 'returns an Enumerator' do
        expect(subject).to be_a(Enumerator)
      end
      it '.to_a returns an empty array' do
        expect(subject.to_a).to match_array []
      end
    end
  end

  context 'when the block { ->(a) { a * 2 } } is given' do
    let(:block) { ->(a) { a * 2 } }
    context 'and reciever is array [1, 2, 3]' do
      it 'returns array [2, 4, 6]' do
        expect(subject).to match_array [2, 4, 6]
      end
    end

    context 'or reciever is an empty array' do
      subject { Array.new([]).my_map(&block) }
      it 'returns an empty array' do
        expect(subject).to match_array []
      end
    end
  end

  context 'when the block { ->(a) { a.odd? } is given' do
    let(:block) { ->(a) { a.odd? } }
    context 'and reciever is array [1, 2, 3]' do
      it 'returns array [true, false, true]' do
        expect(subject).to match_array [true, false, true]
      end
    end

    context 'or reciever is an empty array' do
      subject { Array.new([]).my_map(&block) }
      it 'returns an empty array' do
        expect(subject).to match_array []
      end
    end
  end
end

RSpec.describe '#my_select' do
  subject { Array.new([1, 2, 3]).my_select(&block) }
  context 'when no block is given' do
    let(:block) {}
    context 'and reciever is array [1, 2, 3]' do
      it 'returns an Enumerator' do
        expect(subject).to be_a(Enumerator)
      end
      it '.to_a returns array [1, 2, 3]' do
        expect(subject.to_a).to match_array [1, 2, 3]
      end
    end

    context 'or reciever is an empty array' do
      subject { Array.new([]).my_select(&block) }
      it 'returns an Enumerator' do
        expect(subject).to be_a(Enumerator)
      end
      it '.to_a returns an empty array' do
        expect(subject.to_a).to match_array []
      end
    end
  end

  context 'when the block { ->(a) { a < 3 } } is given' do
    let(:block) { ->(a) { a < 3 } }
    context 'and reciever is array [1, 2, 3]' do
      it 'returns array [1, 2]' do
        expect(subject).to match_array [1, 2]
      end
    end

    context 'or reciever is an empty array' do
      subject { Array.new([]).my_select(&block) }
      it 'returns an empty array' do
        expect(subject).to match_array []
      end
    end
  end

  context 'when the block { ->(a) { a.odd? } } is given' do
    let(:block) { ->(a) { a.odd? } }
    context 'and reciever is array [1, 2, 3]' do
      it 'returns array [1, 3]' do
        expect(subject).to match_array [1, 3]
      end
    end

    context 'or reciever is an empty array' do
      subject { Array.new([]).my_select(&block) }
      it 'returns an empty array' do
        expect(subject).to match_array []
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
