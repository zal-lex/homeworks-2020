class Array
  def initialize(arr)
    @arr = arr
  end

  def my_select
    tmp = []
    i = 0
    while i < @arr.size
      tmp << @arr[i] if block_given? && yield(@arr[i])
      i += 1
    end
    tmp
  end
end

my_arr = Array.new([1, 2, 3])

output = my_arr.my_select { |element| element < 3 }
p output
