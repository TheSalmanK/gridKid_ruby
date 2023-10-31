
require_relative 'primitive'
class Parser
  def initialize(tokens)
    @tokens = tokens
    @i = 0
  end

  def has(type)
    @i < @tokens.length && @tokens[@i][:type] == type
  end

  def advance
    token = @tokens[@i]
    @i += 1
    token
  end

  def expr
    relational
  end

  def atom
    if has(:number)
      token = advance[:source]
      if token.include?('.')
        return FloatPrimitive.new(token.to_f)
      else
        return IntegerPrimitive.new(token.to_i)
      end
    elsif has(:true_literal)
      advance
      return BooleanPrimitive.new(true)
    elsif has(:false_literal)
      advance
      return BooleanPrimitive.new(false)
    elsif has(:left_parenthesis)
      advance
      e = expr
      if has(:right_parenthesis)
        advance
        return e
      else
        raise "Expected ')'"
      end
    else
      raise "Unexpected token: #{@tokens[@i]}"
    end
  end
  
  
  def has(type)
    @i < @tokens.length && @tokens[@i][:type] == type
  end
  
  

  def additive
    left = multiplicative
    while has(:plus) || has(:hyphen)
      if has(:plus)
        advance
        right = multiplicative
        left = Addition.new(left, right)
      elsif has(:hyphen)
        advance
        right = multiplicative
        left = Subtraction.new(left, right)
      end
    end
    left
  end

  def multiplicative
    left = power
    while has(:asterisk) || has(:slash)
      if has(:asterisk)
        advance
        right = power
        left = Multiplication.new(left, right)
      elsif has(:slash)
        advance
        right = power
        left = Division.new(left, right)
      end
    end
    left
  end

  def power
    left = unary
    while has(:caret)
      advance
      right = unary
      left = Power.new(left, right)
    end
    left
  end

  def unary
    if has(:not)
      advance
      operand = unary
      Not.new(operand)
    elsif has(:hyphen)
      advance
      operand = unary
      UnaryMinus.new(operand)
    else
      atom
    end
  end
  def relational
    left = additive
    while has(:greater_than) || has(:less_than) || has(:equal) || has(:not_equal)
      if has(:greater_than)
        advance
        right = additive
        left = GreaterThan.new(left, right)
      elsif has(:less_than)
        advance
        right = additive
        left = LessThan.new(left, right)
      elsif has(:equal)
        advance
        right = additive
        left = Equals.new(left, right)
      elsif has(:not_equal)
        advance
        right = additive
        left = NotEquals.new(left, right)
      end
    end
    left
  end
  
  

end
