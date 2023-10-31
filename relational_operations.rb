# relational_operations.rb

class Equals < Expression
   attr_reader :left, :right
 
   def initialize(left, right)
     @left = left
     @right = right
   end
 
   def evaluate(environment)
     left_value = @left.evaluate(environment).value
     right_value = @right.evaluate(environment).value
     BooleanPrimitive.new(left_value == right_value)
   end
 
   def to_s
     "#{@left.to_s} == #{@right.to_s}"
   end
 end
 
 class NotEquals < Expression
   attr_reader :left, :right
 
   def initialize(left, right)
     @left = left
     @right = right
   end
 
   def evaluate(environment)
     left_value = @left.evaluate(environment).value
     right_value = @right.evaluate(environment).value
     BooleanPrimitive.new(left_value != right_value)
   end
 
   def to_s
     "#{@left.to_s} != #{@right.to_s}"
   end
 end
 
 class LessThan < Expression
   attr_reader :left, :right
 
   def initialize(left, right)
     @left = left
     @right = right
   end
 
   def evaluate(environment)
     left_value = @left.evaluate(environment).value
     right_value = @right.evaluate(environment).value
     BooleanPrimitive.new(left_value < right_value)
   end
 
   def to_s
     "#{@left.to_s} < #{@right.to_s}"
   end
 end
 
 class LessThanOrEqual < Expression
   attr_reader :left, :right
 
   def initialize(left, right)
     @left = left
     @right = right
   end
 
   def evaluate(environment)
     left_value = @left.evaluate(environment).value
     right_value = @right.evaluate(environment).value
     BooleanPrimitive.new(left_value <= right_value)
   end
 
   def to_s
     "#{@left.to_s} <= #{@right.to_s}"
   end
 end
 
 class GreaterThan < Expression
   attr_reader :left, :right
 
   def initialize(left, right)
     @left = left
     @right = right
   end
 
   def evaluate(environment)
     left_value = @left.evaluate(environment).value
     right_value = @right.evaluate(environment).value
     BooleanPrimitive.new(left_value > right_value)
   end
 
   def to_s
     "#{@left.to_s} > #{@right.to_s}"
   end
 end
 
 class GreaterThanOrEqual < Expression
   attr_reader :left, :right
 
   def initialize(left, right)
     @left = left
     @right = right
   end
 
   def evaluate(environment)
     left_value = @left.evaluate(environment).value
     right_value = @right.evaluate(environment).value
     BooleanPrimitive.new(left_value >= right_value)
   end
 
   def to_s
     "#{@left.to_s} >= #{@right.to_s}"
   end
 end
 