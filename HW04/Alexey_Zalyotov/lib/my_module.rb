module MyModule
  def my_each
    if block_given?
      i = 0
      while i < @arr.size
        yield(@arr[i])
        i += 1
      end
    else
      @arr.to_enum
    end
  end

  def my_map
    if block_given?
      tmp = []
      my_each do |element|
        tmp << yield(element)
      end
      tmp
    else
      @arr.to_enum
    end
  end

  def my_select
    if block_given?
      tmp = []
      my_each do |element|
        tmp << element if yield(element)
      end
      tmp
    else
      @arr.to_enum
    end
  end
end
