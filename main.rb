# main.rb

require_relative 'primitive'
require_relative 'expression'
require_relative 'logical_operations'
require_relative 'cell_reference'
require_relative 'bitwise_operations'
require_relative 'relational_operations'
require_relative 'casting_operations'
require_relative 'statistical_functions'
require_relative 'grid'
require_relative 'environment'
require_relative 'lexer'
require_relative 'parser'

# Create a new environment with a 10x10 grid
env = Environment.new(10, 10)

# Set some values in the grid for testing
env.set_cell_value(1, 1, IntegerPrimitive.new(5))
env.set_cell_value(1, 2, IntegerPrimitive.new(10))
env.set_cell_value(1, 3, FloatPrimitive.new(7.5))

puts "=== Arithmetic Operations ==="
expr1 = CellRValue.new(1, 1)
expr2 = CellRValue.new(1, 2)
addition_expression = Addition.new(expr1, expr2)
puts "Addition (5 + 10): #{addition_expression.evaluate(env).to_s}"

subtraction_expression = Subtraction.new(expr1, expr2)
puts "Subtraction (5 - 10): #{subtraction_expression.evaluate(env).to_s}"

multiplication_expression = Multiplication.new(expr1, expr2)
puts "Multiplication (5 * 10): #{multiplication_expression.evaluate(env).to_s}"

division_expression = Division.new(expr2, expr1)
puts "Division (10 / 5): #{division_expression.evaluate(env).to_s}"

modulo_expression = Modulo.new(expr2, expr1)
puts "Modulo (10 % 5): #{modulo_expression.evaluate(env).to_s}"

puts "\n=== Logical Operations ==="
expr_true = BooleanPrimitive.new(true)
expr_false = BooleanPrimitive.new(false)
and_expression = And.new(expr_true, expr_false)
puts "And (true && false): #{and_expression.evaluate(env).to_s}"

or_expression = Or.new(expr_true, expr_false)
puts "Or (true || false): #{or_expression.evaluate(env).to_s}"

not_expression = Not.new(expr_true)
puts "Not (!true): #{not_expression.evaluate(env).to_s}"


puts "\n=== Relational Operations ==="
equals_expression = Equals.new(expr1, expr2)
puts "Equals (5 == 10): #{equals_expression.evaluate(env).to_s}"

not_equals_expression = NotEquals.new(expr1, expr2)
puts "Not Equals (5 != 10): #{not_equals_expression.evaluate(env).to_s}"

less_than_expression = LessThan.new(expr1, expr2)
puts "Less Than (5 < 10): #{less_than_expression.evaluate(env).to_s}"

puts "\n=== Casting Operations ==="
expr3 = CellRValue.new(1, 3)
float_to_int_expression = FloatToInt.new(expr3)
puts "Float to Int (7.5 to int): #{float_to_int_expression.evaluate(env).to_s}"

int_to_float_expression = IntToFloat.new(expr1)
puts "Int to Float (5 to float): #{int_to_float_expression.evaluate(env).to_s}"

puts "\n=== Statistical Functions ==="
max_expression = MaxFunction.new(expr1, expr2, expr3)
puts "Max of (5, 10, 7.5): #{max_expression.evaluate(env).to_s}"

# MinFunction Test
min_expression = MinFunction.new(expr1, expr2, expr3)
puts "Min of (5, 10, 7.5): #{min_expression.evaluate(env).to_s}"

# MeanFunction Test
mean_expression = MeanFunction.new(expr1, expr2, expr3)
puts "Mean of (5, 10, 7.5): #{mean_expression.evaluate(env).to_s}"

# SumFunction Test
sum_expression = SumFunction.new(expr1, expr2, expr3)
puts "Sum of (5, 10, 7.5): #{sum_expression.evaluate(env).to_s}"

puts "\n=== Cell References ==="
lvalue = CellLValue.new(1, 2)
puts "LValue of (1, 2): #{lvalue.evaluate(env).to_s}"

rvalue = CellRValue.new(1, 2)
puts "RValue of (1, 2): #{rvalue.evaluate(env).to_s}"

puts "\n=== Bitwise Operations ==="
bitwise_and_expression = BitwiseAnd.new(expr1, expr2)
puts "Bitwise And (5 & 10): #{bitwise_and_expression.evaluate(env).to_s}"

bitwise_or_expression = BitwiseOr.new(expr1, expr2)
puts "Bitwise Or (5 | 10): #{bitwise_or_expression.evaluate(env).to_s}"

bitwise_xor_expression = BitwiseXor.new(expr1, expr2)
puts "Bitwise Xor (5 ^ 10): #{bitwise_xor_expression.evaluate(env).to_s}"

bitwise_not_expression = BitwiseNot.new(expr1)
puts "Bitwise Not (~5): #{bitwise_not_expression.evaluate(env).to_s}"

bitwise_left_shift_expression = BitwiseLeftShift.new(expr1, IntegerPrimitive.new(2))
puts "Bitwise Left Shift (5 << 2): #{bitwise_left_shift_expression.evaluate(env).to_s}"

bitwise_right_shift_expression = BitwiseRightShift.new(expr2, IntegerPrimitive.new(2))
puts "Bitwise Right Shift (10 >> 2): #{bitwise_right_shift_expression.evaluate(env).to_s}"

puts "\n=== Relational Operations ==="
greater_than_expression = GreaterThan.new(expr1, expr2)
puts "Greater Than (5 > 10): #{greater_than_expression.evaluate(env).to_s}"

less_than_or_equal_expression = LessThanOrEqual.new(expr1, expr2)
puts "Less Than or Equal (5 <= 10): #{less_than_or_equal_expression.evaluate(env).to_s}"

greater_than_or_equal_expression = GreaterThanOrEqual.new(expr1, expr2)
puts "Greater Than or Equal (5 >= 10): #{greater_than_or_equal_expression.evaluate(env).to_s}"

puts "\n=== Statistical Functions ==="
min_expression = MinFunction.new(expr1, expr2, expr3)
puts "Min of (5, 10, 7.5): #{min_expression.evaluate(env).to_s}"

mean_expression = MeanFunction.new(expr1, expr2, expr3)
puts "Mean of (5, 10, 7.5): #{mean_expression.evaluate(env).to_s}"

sum_expression = SumFunction.new(expr1, expr2, expr3)
puts "Sum of (5, 10, 7.5): #{sum_expression.evaluate(env).to_s}"

puts "\n=== Cell References ==="
# Setting a new value using LValue and then retrieving it using RValue
lvalue = CellLValue.new(1, 2)
rvalue = CellRValue.new(1, 2)
lvalue.set_value(env, IntegerPrimitive.new(20))

puts "After setting LValue of (1, 2) to 20, RValue of (1, 2): #{rvalue.evaluate(env).to_s}\n"

puts "\n=== Lexer Testing ==="

lexer = Lexer.new("3.14 + 2 * (4 - 1) ^ 2")
tokens = lexer.lex
puts tokens.inspect
puts("\n")
lexer2 = Lexer.new("5 <= 32.0")
tokens2 = lexer2.lex
puts tokens2.inspect

puts "\n"

puts "\n=== Lexer With Letters ==="

lexer = Lexer.new("pi + 3.14 * radius - 2^exponent")
tokens = lexer.lex
puts tokens.inspect
lex3 = Lexer.new("True")
tokens3 = lex3.lex
puts tokens3.inspect
lex4 = Lexer.new("False")
tokens4 = lex4.lex
puts tokens4.inspect
lex5 = Lexer.new("Nil")
tokens5 = lex5.lex
puts tokens5.inspect

puts "\n=== Parser Testing ==="

def test_parser(input, expected_output)
  lexer = Lexer.new(input)
  tokens = lexer.lex
  parser = Parser.new(tokens)
  ast = parser.expr
  result = ast.evaluate({})

  # Extract the value from the result if it's a Primitive
  result_value = result.is_a?(Primitive) ? result.value : result
  
  if result_value == expected_output
    puts "Test passed for input '#{input}'. Expected: #{expected_output}, Got: #{result_value}"
  else
    puts "Test failed for input '#{input}'. Expected: #{expected_output}, Got: #{result_value}"
  end
end





puts "\n=== Parser With Arithmetic ==="
# Arithmetic operations
test_parser("5 + 3", 8)
test_parser("5 - 3", 2)
test_parser("5 * 3", 15)
test_parser("6 / 3", 2)
test_parser("5 + 3 * 2", 11)
test_parser("(5 + 3) * 2", 16)
test_parser("5 + 5 + 5", 15)


puts "\n=== Parser With Relational ==="
# Boolean operations
test_parser("True && False", false)
test_parser("True || False", true)
test_parser("!True", false)
test_parser("!False", true)
test_parser("True && !False", true)

puts "\n=== Parser With combinations ==="
# Combined
test_parser("5 + 3 > 7", true)
test_parser("5 + 3 < 7", false)
test_parser("5 + 3 == 8", true)
test_parser("5 != 2 + 1", true)

puts "\n=== Parser With Parenthesis ==="
# Parenthesis
test_parser("(5 + 3) * 2", 16)
test_parser("5 + (3 * 2)", 11)
test_parser("((5 + 3) * 2) + 1", 17)


