# logical_operations.rb

class And < Expression
  attr_reader :left, :right

  def initialize(left, right)
    @left = left
    @right = right
  end

  def evaluate(environment)
    left_value = @left.is_a?(BooleanPrimitive) ? @left.value : @left.evaluate(environment).value
    
    # Short-circuiting for AND operation
    return BooleanPrimitive.new(false) unless left_value

    right_value = @right.is_a?(BooleanPrimitive) ? @right.value : @right.evaluate(environment).value
    BooleanPrimitive.new(left_value && right_value)
  end

  def to_s
    "#{@left.to_s} && #{@right.to_s}"
  end
end

class Or < Expression
  attr_reader :left, :right

  def initialize(left, right)
    @left = left
    @right = right
  end

  def evaluate(environment)
    left_value = @left.is_a?(BooleanPrimitive) ? @left.value : @left.evaluate(environment).value
    
    # Short-circuiting for OR operation
    return BooleanPrimitive.new(true) if left_value

    right_value = @right.is_a?(BooleanPrimitive) ? @right.value : @right.evaluate(environment).value
    BooleanPrimitive.new(left_value || right_value)
  end

  def to_s
    "#{@left.to_s} || #{@right.to_s}"
  end
end

class Not < Expression
  attr_reader :expression

  def initialize(expression)
    @expression = expression
  end

  def evaluate(environment)
    value = @expression.is_a?(BooleanPrimitive) ? @expression.value : @expression.evaluate(environment).value
    BooleanPrimitive.new(!value)
  end

  def to_s
    "!#{@expression.to_s}"
  end
end
