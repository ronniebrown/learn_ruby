class RPNCalculator
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def to_s
    return @stack.to_s
  end

  def push(num)
    @stack.push(num)
  end
    
  def pop
    return @stack.pop
  end

  def value
    if (@stack.length > 0)
      return @stack[@stack.length - 1]
    else
      raise "calculator is empty"
    end
  end

  def plus
    if (@stack.length > 1)
      last = @stack.pop
      @stack[-1] = @stack[-1] + last
    else
        raise "calculator is empty"
    end
  end
    
  def minus
    if (@stack.length > 1)
      last = @stack.pop
      @stack[-1] = @stack[-1] - last
    else
      raise "calculator is empty"
    end
  end
  
  def times
    if (@stack.length > 1)
      last = @stack.pop
      @stack[-1] = @stack[-1].to_f * last.to_f
    else
      raise "calculator is empty"
    end
  end
    
  def divide
    if (@stack.length > 1)
      last = @stack.pop
      @stack[-1] = @stack[-1].to_f / last.to_f
    else
      raise "calculator is empty"
    end
  end

  def tokens(str)
    strArr = str.split(/\s/)
        strArr.each_index do |x|
          if (strArr[x] =~ /^[0-9\/*+-]{1}$/)
            if (strArr[x] =~ /[*]/)
              strArr[x] = :*
            elsif (strArr[x] =~ /[+]/)
              strArr[x] = :+
            elsif (strArr[x] =~ /[-]/)
              strArr[x] = :-
            elsif (strArr[x] =~ /[\/]/)
              strArr[x] = :/
            else
              strArr[x] = strArr[x].to_f
            end
          else
            raise "Bad token"
        end
    end
    return strArr
  end

  def evaluate(str)
    opArr = self.tokens(str)
    opArr.reverse!()
    @stack = []
      while (opArr.length > 0)
        entry = opArr.pop
        if (entry == :+)
          self.plus
        elsif (entry == :-)
          self.minus()
        elsif (entry == :*)
          self.times
        elsif (entry == :/)
          self.divide
        else
          @stack.push(entry)
        end
      end
    return self.value
  end
end