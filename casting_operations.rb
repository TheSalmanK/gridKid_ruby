# casting_operations.rb

class FloatToInt < Expression
   attr_reader :expression
 
   def initialize(expression)
     @expression = expression
   end
 
   def evaluate(environment)
     float_value = @expression.evaluate(environment).value
     IntegerPrimitive.new(float_value.to_i)
   end
 
   def to_s
     "int(#{@expression.to_s})"
   end
 end
 
 class IntToFloat < Expression
   attr_reader :expression
 
   def initialize(expression)
     @expression = expression
   end
 
   def evaluate(environment)
     int_value = @expression.evaluate(environment).value
     FloatPrimitive.new(int_value.to_f)
   end
 
   def to_s
     "float(#{@expression.to_s})"
   end
 end
 