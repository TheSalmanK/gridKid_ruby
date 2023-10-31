# bitwise_operations.rb

class BitwiseAnd < Expression
  attr_reader :left, :right

  def initialize(left, right)
    @left = left
    @right = right
  end

  def evaluate(environment)
    left_value = @left.evaluate(environment).value
    right_value = @right.evaluate(environment).value
    IntegerPrimitive.new(left_value & right_value)
  end

  def to_s
    "#{@left.to_s} & #{@right.to_s}"
  end
end


class BitwiseOr < Expression
  attr_reader :left, :right

  def initialize(left, right)
    @left = left
    @right = right
  end

  def evaluate(environment)
    left_value = @left.evaluate(environment).value
    right_value = @right.evaluate(environment).value
    IntegerPrimitive.new(left_value | right_value)
  end

  def to_s
    "#{@left.to_s} | #{@right.to_s}"
  end
end

class BitwiseXor < Expression
  attr_reader :left, :right

  def initialize(left, right)
    @left = left
    @right = right
  end

  def evaluate(environment)
    left_value = @left.evaluate(environment).value
    right_value = @right.evaluate(environment).value
    IntegerPrimitive.new(left_value ^ right_value)
  end

  def to_s
    "#{@left.to_s} ^ #{@right.to_s}"
  end
end

class BitwiseNot < Expression
  attr_reader :expression

  def initialize(expression)
    @expression = expression
  end

  def evaluate(environment)
    value = @expression.evaluate(environment).value
    IntegerPrimitive.new(~value)
  end

  def to_s
    "~#{@expression.to_s}"
  end
end

class BitwiseLeftShift < Expression
  attr_reader :expression, :shift_value

  def initialize(expression, shift_value)
    @expression = expression
    @shift_value = shift_value
  end

  def evaluate(environment)
    value = @expression.is_a?(IntegerPrimitive) ? @expression.value : @expression.evaluate(environment).value
    shift = @shift_value.is_a?(IntegerPrimitive) ? @shift_value.value : @shift_value.evaluate(environment).value
    IntegerPrimitive.new(value << shift)
  end

  def to_s
    "#{@expression.to_s} << #{@shift_value.to_s}"
  end
end

class BitwiseRightShift < Expression
  attr_reader :expression, :shift_value

  def initialize(expression, shift_value)
    @expression = expression
    @shift_value = shift_value
  end

  def evaluate(environment)
    value = @expression.is_a?(IntegerPrimitive) ? @expression.value : @expression.evaluate(environment).value
    shift = @shift_value.is_a?(IntegerPrimitive) ? @shift_value.value : @shift_value.evaluate(environment).value
    IntegerPrimitive.new(value >> shift)
  end

  def to_s
    "#{@expression.to_s} >> #{@shift_value.to_s}"
  end
end
