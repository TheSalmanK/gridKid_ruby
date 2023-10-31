# grid.rb

class Grid
   def initialize(rows, cols)
     @grid = Array.new(rows) { Array.new(cols) }
   end
 
   def set_cell(x, y, value)
     @grid[x][y] = value
   end
 
   def get_cell(x, y)
     @grid[x][y]
   end
 end
 