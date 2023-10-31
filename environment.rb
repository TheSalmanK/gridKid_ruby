# environment.rb

class Environment
   def initialize(rows, cols)
     @grid = Grid.new(rows, cols)
   end
 
   def set_cell_value(x, y, value)
     @grid.set_cell(x, y, value)
   end
 
   def get_cell_value(x, y)
     @grid.get_cell(x, y)
   end
 end
 