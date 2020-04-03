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
      i = 0
      while i < @arr.size
        tmp << yield(@arr[i])
        i += 1
      end
      tmp
    else
      @arr.to_enum
    end
  end

  def my_select
    if block_given?
      tmp = []
      i = 0
      while i < @arr.size
        tmp << @arr[i]
        i += 1
      end
      tmp
    else
      @arr.to_enum
    end
  end
end
