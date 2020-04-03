module MyModule
  def my_each
    i = 0
    while i < @arr.size
      yield(@arr[i]) if block_given?
      i += 1
    end
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
