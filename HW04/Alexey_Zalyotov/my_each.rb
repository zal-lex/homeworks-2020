class Array
  def initialize(arr)
    @arr = arr
  end

  def my_each
    i = 0
    while i < @arr.size
      yield(@arr[i]) if block_given?
      i += 1
    end
  end
end

my_arr = Array.new([1, 2, 3])

my_arr.my_each do |element|
  puts element * 2
end
