# statistical_functions.rb

class MaxFunction < Expression
   attr_reader :expressions
 
   def initialize(*expressions)
     @expressions = expressions
   end
 
   def evaluate(environment)
     max_value = @expressions.map { |expr| expr.evaluate(environment).value }.max
     IntegerPrimitive.new(max_value)
   end
 
   def to_s
     "max(#{expressions.map(&:to_s).join(', ')})"
   end
 end
 
 class MinFunction < Expression
   attr_reader :expressions
 
   def initialize(*expressions)
     @expressions = expressions
   end
 
   def evaluate(environment)
     min_value = @expressions.map { |expr| expr.evaluate(environment).value }.min
     IntegerPrimitive.new(min_value)
   end
 
   def to_s
     "min(#{expressions.map(&:to_s).join(', ')})"
   end
 end
 
 class MeanFunction < Expression
   attr_reader :expressions
 
   def initialize(*expressions)
     @expressions = expressions
   end
 
   def evaluate(environment)
     values = @expressions.map { |expr| expr.evaluate(environment).value }
     mean_value = values.sum.to_f / values.size
     FloatPrimitive.new(mean_value)
   end
 
   def to_s
     "mean(#{expressions.map(&:to_s).join(', ')})"
   end
 end
 
 class SumFunction < Expression
   attr_reader :expressions
 
   def initialize(*expressions)
     @expressions = expressions
   end
 
   def evaluate(environment)
     sum_value = @expressions.map { |expr| expr.evaluate(environment).value }.sum
     IntegerPrimitive.new(sum_value)
   end
 
   def to_s
     "sum(#{expressions.map(&:to_s).join(', ')})"
   end
 end
 