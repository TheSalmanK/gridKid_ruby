# expression.rb

class Expression
   def evaluate(environment)
     raise NotImplementedError, 'Subclasses must define the evaluate method'
   end
 
   def to_s
     raise NotImplementedError, 'Subclasses must define the to_s method'
   end
 end
 

class BinaryOperation
  attr_reader :left_operand, :right_operand

  def initialize(left_operand, right_operand)
    @left_operand = left_operand
    @right_operand = right_operand
  end

  def evaluate_operand(operand, environment)
    if operand.is_a?(Primitive)
      operand.value
    else
      operand.evaluate(environment).value
    end
  end  
end

# ======= HELPER FOR TYPE CHECKING =======

def result_value(left_val, right_val, result)
  (left_val.is_a?(Integer) && right_val.is_a?(Integer)) ? result.to_i : result.to_f
end

# ================= DONE =================

class Addition < BinaryOperation
  def evaluate(environment)
    left_val = evaluate_operand(@left_operand, environment)
    right_val = evaluate_operand(@right_operand, environment)
    
    # Type checking for operands
    unless left_val.is_a?(Numeric) && right_val.is_a?(Numeric)
      raise TypeError, "Operands must be numeric for addition"
    end

    result = left_val + right_val
    IntegerPrimitive.new(result_value(left_val, right_val, result))
  end
   def to_s
     "#{@left.to_s} + #{@right.to_s}"
   end
 end
 
 class Subtraction < BinaryOperation
 def evaluate(environment)
   left_val = evaluate_operand(@left_operand, environment)
   right_val = evaluate_operand(@right_operand, environment)
   
   # Type checking for operands
   unless left_val.is_a?(Numeric) && right_val.is_a?(Numeric)
     raise TypeError, "Operands must be numeric for subtraction"
   end

   result = left_val - right_val
    IntegerPrimitive.new(result_value(left_val, right_val, result))
  end
   def to_s
     "#{@left.to_s} - #{@right.to_s}"
   end
 end

 class Multiplication < BinaryOperation
  def evaluate(environment)
    left_val = evaluate_operand(@left_operand, environment)
    right_val = evaluate_operand(@right_operand, environment)
    
    # Type checking for operands
    unless left_val.is_a?(Numeric) && right_val.is_a?(Numeric)
      raise TypeError, "Operands must be numeric for multiplication"
    end

    result = left_val * right_val
    IntegerPrimitive.new(result_value(left_val, right_val, result))
  end
 
   def to_s
     "#{@left.to_s} * #{@right.to_s}"
   end
 end
 
 class Division < BinaryOperation
  def evaluate(environment)
    left_val = evaluate_operand(@left_operand, environment)
    right_val = evaluate_operand(@right_operand, environment)
    
    # Type checking for operands
    unless left_val.is_a?(Numeric) && right_val.is_a?(Numeric)
      raise TypeError, "Operands must be numeric for division"
    end

    # Ensure we don't divide by zero
    raise "Division by zero error" if right_val == 0

    result = left_val / right_val
    IntegerPrimitive.new(result_value(left_val, right_val, result))
  end
 
   def to_s
     "#{@left.to_s} / #{@right.to_s}"
   end
 end
 
 class Modulo < BinaryOperation
  def evaluate(environment)
    left_val = evaluate_operand(@left_operand, environment)
    right_val = evaluate_operand(@right_operand, environment)
    
    # Type checking for operands
    unless left_val.is_a?(Numeric) && right_val.is_a?(Numeric)
      raise TypeError, "Operands must be numeric for modulo"
    end

    result = left_val % right_val
    IntegerPrimitive.new(result_value(left_val, right_val, result))
  end
 
   def to_s
     "#{@left.to_s} % #{@right.to_s}"
   end
 end

 class Exponentiation < BinaryOperation
  def evaluate(environment)
    left_val = evaluate_operand(@left_operand, environment)
    right_val = evaluate_operand(@right_operand, environment)
    
    # Type checking for operands
    unless left_val.is_a?(Numeric) && right_val.is_a?(Numeric)
      raise TypeError, "Operands must be numeric for exponentiation"
    end

    result = left_val ** right_val
    IntegerPrimitive.new(result_value(left_val, right_val, result))
  end
end

 class And < Expression
   attr_reader :left, :right
 
   def initialize(left, right)
     @left = left
     @right = right
   end
 
   def evaluate(environment)
     left_value = @left.evaluate(environment).value
     right_value = @right.evaluate(environment).value
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
     left_value = @left.evaluate(environment).value
     right_value = @right.evaluate(environment).value
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
     value = @expression.evaluate(environment).value
     BooleanPrimitive.new(!value)
   end
 
   def to_s
     "!#{@expression.to_s}"
   end
 end
 
