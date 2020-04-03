class Array
  def initialize(arr)
    @arr = arr
  end

  def my_map
    tmp = []
    i = 0
    while i < @arr.size
      tmp << yield(@arr[i]) if block_given?
      i += 1
    end
    tmp
  end
end

my_arr = Array.new([1, 2, 3])

output = my_arr.my_map { |element| element * 2 }
p output
