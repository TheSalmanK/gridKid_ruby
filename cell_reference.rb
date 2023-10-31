# cell_reference.rb

class CellReference
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    "(#{@x}, #{@y})"
  end

  def to_a
    [@x, @y]
  end
end

class CellLValue < CellReference
 # LValue refers to the cell's address

 def evaluate(environment)
   # Returns the address as an array
   to_a
 end

 def set_value(environment, value)
   environment.set_cell_value(@x, @y, value)
 end
end

class CellRValue < CellReference
  # RValue refers to the cell's value

  def evaluate(environment)
    # Returns the value at the address
    environment.get_cell_value(@x, @y)
  end
  
  def value(environment)
   # This method retrieves the value of the cell
   evaluate(environment)
  end
end
